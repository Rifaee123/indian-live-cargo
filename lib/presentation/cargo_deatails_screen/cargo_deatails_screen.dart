import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/image_constant.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/update_status_with_image/update_status_with_image_api.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/all_cargo_screen.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';
import 'package:indian_live_cargo_mobileapp/theme/app_decoration.dart';
import 'package:indian_live_cargo_mobileapp/theme/custom_text_style.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_elevated_button.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_image_view.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_text_form_field.dart';
import 'controller/cargo_deatails_screen_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CargoDeatailsScreen extends StatefulWidget {
  CargoDeatailsScreen(this.cargodata, {super.key, this.tripNum});

  CargoData cargodata;
  final int? tripNum;

  @override
  State<CargoDeatailsScreen> createState() => _CargoDeatailsScreenState();
}

class _CargoDeatailsScreenState extends State<CargoDeatailsScreen> {
  UpdateStatusWithImageController updateController =
      Get.put(UpdateStatusWithImageController());
  CargoDeatailsScreenController controller =
      Get.put(CargoDeatailsScreenController());
  String cargoIds = "";
  void addToCargoIds(int id) {
    setState(() {
      if (cargoIds.isEmpty) {
        cargoIds = "$id";
      } else {
        cargoIds = "$cargoIds,$id";
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addToCargoIds(widget.cargodata.id!);
    log(cargoIds.toString());
  }

  @override
  Widget build(BuildContext context) {
    Map<int, String> statusMap = {
      0: 'On the way',
      1: 'Out for Delivery',
      2: 'In Transit',
      3: 'Delivered',
      4: 'Pending',
      5: 'Not Delivered',
      6: 'Recheck',
    };

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.indigo800,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 16.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildRightArrowZipcode(widget.cargodata, context),
                      SizedBox(height: 25.v),
                      SizedBox(
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 750.v,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 21.h,
                                  vertical: 41.v,
                                ),
                                decoration: AppDecoration.fillWhiteA.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderTL50,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Obx(() => Container(
                                          // width: 380.h,
                                          height: 50.v,
                                          decoration: BoxDecoration(
                                              color: appTheme.blueGray100,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.h))),
                                          child: Center(
                                              child: DropdownButton<int>(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                            dropdownColor: Colors.white,
                                            focusColor: Colors.black,
                                            value:
                                                controller.selectedValue.value,
                                            onChanged: (int? newValue) {
                                              if (newValue != null) {
                                                controller.selectedValue.value =
                                                    newValue;
                                              }
                                            },
                                            items: statusMap.entries.map<
                                                    DropdownMenuItem<int>>(
                                                (MapEntry<int, String> entry) {
                                              return DropdownMenuItem<int>(
                                                value: entry.key,
                                                child: Text(entry.value),
                                              );
                                            }).toList(),
                                          )),
                                        )),
                                    SizedBox(height: 32.v),
                                    CustomTextFormField(
                                      autofocus: false,
                                      controller: controller.commentController,
                                      hintText: "lbl_comments".tr,
                                      textInputAction: TextInputAction.done,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.h,
                                        vertical: 16.v,
                                      ),
                                      borderDecoration:
                                          TextFormFieldStyleHelper.fillBlueGray,
                                      fillColor: appTheme.blueGray100,
                                    ),
                                    SizedBox(height: 26.v),
                                    Obx(() => controller.selectedValue == 3
                                        ? _body()
                                        : SizedBox()),
                                    SizedBox(height: 26.v),
                                    CustomElevatedButton(
                                      height: 36.v,
                                      width: 148.h,
                                      text: "Update",
                                      buttonStyle: ButtonStyle(
                                        textStyle:
                                            MaterialStatePropertyAll(TextStyle(
                                          color: Colors.white,
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                appTheme.indigo800),
                                      ),
                                      onPressed: () async {
                                        log(cargoIds.toString());
                                        if (controller.selectedValue.value !=
                                            3) {
                                          controller.UpdatecargoStatuscontroller
                                              .updateCargoStatus(
                                                  authtoken: "",
                                                  cargoIds: cargoIds,
                                                  statusId: controller
                                                      .selectedValue.value);
                                        } else {
                                          if (controller.cropedfile.value !=
                                              null) {
                                            final path = controller
                                                .cropedfile.value!.path;
                                            await updateController
                                                .updateCargoStatusWithAttachment(
                                                    File(path),
                                                    controller
                                                        .selectedValue.value,
                                                    widget.cargodata.id!
                                                        .toString());
                                          } else {
                                            final path = controller
                                                .imagePath.value!.path;
                                            await updateController
                                                .updateCargoStatusWithAttachment(
                                                    File(path),
                                                    controller
                                                        .selectedValue.value,
                                                    widget.cargodata.id!
                                                        .toString());
                                          }
                                        }
                                        controller.getallcargocontroller
                                            .getCargos('', widget.tripNum!);
                                        setState(() {
                                          cargoIds = '';
                                        });
                                      },
                                      // buttonTextStyle:
                                      //     theme.textTheme.bodyLarge!,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRightArrowZipcode(CargoData data, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          AllCargoScreenScreen(tripNum: widget.tripNum),
                    ));
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgRightArrow,
                    height: 44.adaptSize,
                    width: 44.adaptSize,
                  ),
                ),
                SizedBox(height: 10.v),
                Text(
                  widget.cargodata.invoiceNumber.toString(),
                  style: CustomTextStyles.titleLargeBold22,
                ),
                SizedBox(height: 12.v),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "msg_reciever_address".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 6.v),
                    SizedBox(
                      width: 212.h,
                      child: Text(
                        widget.cargodata.address.toString(),
                        // "msg_sheeba_charumoodu".tr
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.titleMediumWhiteA700,
                      ),
                    ),
                    SizedBox(height: 5.v),
                    Text(
                      "msg_desc_of_goods".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 7.v),
                    Text(
                      "lbl_house_hold".tr,
                      style: CustomTextStyles.titleMediumWhiteA700,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgIsometricFreightCar4,
            height: 240.v,
            width: 125.h,
            margin: EdgeInsets.only(
              left: 9.h,
              bottom: 33.v,
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    if (controller.cropedfile.value != null ||
        controller.imagePath.value != null) {
      return _imageCard();
    } else {
      return _uploaderCard();
    }
  }

  Widget _imageCard() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: _image(),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          _menu(),
        ],
      ),
    );
  }

  Widget _image() {
    if (controller.cropedfile.value != null) {
      final path = controller.cropedfile.value!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 300.h,
          maxHeight: 300.v,
        ),
        child: Image.file(File(path)),
      );
    } else if (controller.imagePath.value != null) {
      final path = controller.imagePath.value!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 300.h,
          maxHeight: 300.v,
        ),
        child: Image.file(File(path)),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _menu() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            controller.clear();
          },
          backgroundColor: Colors.redAccent,
          tooltip: 'Delete',
          child: const Icon(Icons.delete),
        ),
        if (controller.cropedfile.value == null)
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: FloatingActionButton(
              onPressed: () async {
                await controller.cropImage();
              },
              backgroundColor: const Color(0xFFBC764A),
              tooltip: 'Crop',
              child: const Icon(Icons.crop),
            ),
          )
      ],
    );
  }

  Widget _uploaderCard() {
    return Center(
        child: Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SizedBox(
        width: 320.0,
        height: 350.0,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DottedBorder(
                    radius: const Radius.circular(12.0),
                    dashPattern: const [8, 4],
                    color: Theme.of(context).highlightColor.withOpacity(0.4),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: Theme.of(context).highlightColor,
                            size: 80.0,
                          ),
                          const SizedBox(height: 24.0),
                          Text(
                            'Upload an image to start',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context).highlightColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.openCamera();
                          },
                          child: Container(
                            height: 60.v,
                            width: 67.h,
                            decoration: BoxDecoration(
                              color: appTheme.blueGray100,
                              borderRadius: BorderRadius.circular(
                                10.h,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset("assets/images/camara.png"),
                            ),
                          ),
                        ),
                        SizedBox(height: 13.v),
                        Text(
                          "lbl_camara".tr,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.openGallery();
                          },
                          child: Container(
                            height: 60.v,
                            width: 69.h,
                            decoration: BoxDecoration(
                              color: appTheme.blueGray100,
                              borderRadius: BorderRadius.circular(
                                10.h,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset("assets/images/gallery.png"),
                            ),
                          ),
                        ),
                        SizedBox(height: 14.v),
                        Text(
                          "lbl_gallery".tr,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.v,
              )
            ]),
      ),
    ));
  }
}
