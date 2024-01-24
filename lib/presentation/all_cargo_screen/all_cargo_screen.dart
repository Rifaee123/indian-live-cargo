import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/image_constant.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/controller/all_cargo_screen_controller.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/models/thirteenlist_item_model.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/widgets/thirteenlist_item_widget.dart';

import 'package:flutter/material.dart';
import 'package:indian_live_cargo_mobileapp/presentation/cargo_deatails_screen/cargo_deatails_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/cargo_deatails_screen/controller/cargo_deatails_screen_controller.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/appbar_title.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable

class AllCargoScreenScreen extends StatefulWidget {
  const AllCargoScreenScreen({super.key, required this.tripNum});

  final int? tripNum;

  @override
  State<AllCargoScreenScreen> createState() => _AllCargoScreenScreenState();
}

class _AllCargoScreenScreenState extends State<AllCargoScreenScreen> {
  AllCargoScreenController controller = Get.put(AllCargoScreenController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getcargocontroller.getCargos(
        "2|AhjfNi38T0hkrw2f7UtDhdbyqBQAkKGhupbyEAoP47e54c1a", widget.tripNum!);
  }

  @override
  Widget build(BuildContext context) {
    // controller.tripno = Get.arguments;
    Map<int, String> statusMap = {
      0: 'On the way',
      1: 'Out for Delivery',
      2: 'In Transit',
      3: 'Delivered',
      4: 'Pending',
      5: 'Not Delivered',
      6: 'Recheck',
    };
    Map<int, Color> ColorMap = {
      0: Color(0xff9fa6b2),
      1: Color(0xff3b71ca),
      2: Color(0xff54b4d3),
      3: Color(0xff14a44d),
      4: Color(0xffe4a11b),
      5: Color(0xffdc4c64),
      6: Color(0xffdc4c64),
    };

    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(controller.selectedValue.value),
            body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 25.v,
                    right: 16.h,
                  ),
                  child: Column(
                    children: [
                      Obx(() => Container(
                            // width: 380.h,
                            height: 50.v,
                            decoration: BoxDecoration(
                                color: appTheme.blueGray100,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.h))),
                            child: Center(
                                child: DropdownButton<int>(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                              dropdownColor: Colors.white,
                              focusColor: Colors.black,
                              value: controller.selectedValue.value,
                              onChanged: (int? newValue) {
                                if (newValue != null) {
                                  controller.selectedValue.value = newValue;
                                  log(controller.selectedValue.value
                                      .toString());
                                }
                              },
                              items: statusMap.entries
                                  .map<DropdownMenuItem<int>>(
                                      (MapEntry<int, String> entry) {
                                return DropdownMenuItem<int>(
                                  value: entry.key,
                                  child: Text(entry.value),
                                );
                              }).toList(),
                            )),
                          )),
                      SizedBox(
                        height: 15.v,
                      ),
                      Obx(() =>
                          controller.selectedValue == 3 ? _body() : SizedBox()),
                      SizedBox(
                        height: 15.v,
                      ),
                      Obx(
                        () => GestureDetector(
                          onLongPress: () {
                            // Show the selection UI (e.g., checkboxes)
                          },
                          child: controller.getcargocontroller.isLoading.value
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 12.0,
                                    );
                                  },
                                  itemCount: controller
                                      .getcargocontroller.cargoList.length,
                                  itemBuilder: (context, index) {
                                    CargoData model = controller
                                        .getcargocontroller.cargoList[index];

                                    return LongPressDraggable(
                                      data: model,
                                      feedback: ThirteenlistItemWidget(
                                        statusMap: statusMap,
                                        colorMap: ColorMap,
                                        cargoData: model,
                                        onSelectionChanged: (isSelected) {
                                          controller.toggleSelection(model);
                                        },
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                CargoDeatailsScreen(model,
                                                    tripNum: widget.tripNum),
                                          ));
                                        },
                                        child: ThirteenlistItemWidget(
                                          statusMap: statusMap,
                                          colorMap: ColorMap,
                                          cargoData: model,
                                          onSelectionChanged: (isSelected) {
                                            controller.toggleSelection(model);
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 25.v,
                      ),
                    ],
                  )),
            )));
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

  /// Section Widget
  PreferredSizeWidget _buildAppBar(int selectValue) {
    AllCargoScreenController controller = Get.put(AllCargoScreenController());
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: AppbarLeadingImage(
        onTap: controller.selectValueClear(),
        imagePath: ImageConstant.imgRightArrow,
        margin: EdgeInsets.only(
          left: 17.h,
          top: 24.v,
          bottom: 21.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_all_cargo".tr,
      ),
      styleType: Style.bgStyle,
      actions: [
        Padding(
          padding: EdgeInsets.only(top: 36.v, right: 30.h),
          child: InkWell(
            child: Text("Submit"),
            onTap: () async {
              log(controller.selectedValue.value.toString());
              if (controller.selectedValue.value != 3) {
                await controller.updateStatuscontroller.updateCargoStatus(
                    authtoken: "",
                    cargoIds: controller.cargoIds.value,
                    statusId: controller.selectedValue.value);
              } else {
                if (controller.cropedfile.value != null) {
                  final path = controller.cropedfile.value!.path;
                  await controller.updateController
                      .updateCargoStatusWithAttachment(
                          File(path),
                          controller.selectedValue.value,
                          controller.cargoIds.value);
                } else {
                  final path = controller.imagePath.value!.path;
                  await controller.updateController
                      .updateCargoStatusWithAttachment(
                          File(path),
                          controller.selectedValue.value,
                          controller.cargoIds.value);
                }
              }
              controller.getcargocontroller.getCargos(
                  "2|AhjfNi38T0hkrw2f7UtDhdbyqBQAkKGhupbyEAoP47e54c1a",
                  widget.tripNum!);
              controller.cargoIds.value = '';

              // await controller.updateStatuscontroller
              //     .updateCargoStatus(
              //         authtoken: "",
              //         cargoIds: controller.cargoIds.value,
              //         statusId: controller.selectedValue.value)
              //     .then((value) => controller.getcargocontroller.getCargos(
              //         "2|AhjfNi38T0hkrw2f7UtDhdbyqBQAkKGhupbyEAoP47e54c1a",
              //         widget.tripNum!));
            },
          ),
        )
      ],
    );
  }
}
