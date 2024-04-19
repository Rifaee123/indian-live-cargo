import 'dart:developer';
import 'dart:io';
import 'package:indian_live_cargo_mobileapp/data/apiClient/get_all_tripsheet_api/get_all_tripsheet_api.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/search_api/search_cargo_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/image_constant.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/controller/all_cargo_screen_controller.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/widgets/thirteenlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_tripsheet_screen/all_tripsheet_screen_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/cargo_deatails_screen/cargo_deatails_screen.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/appbar_title.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/custom_app_bar.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_elevated_button.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AllCargoScreenScreen extends StatefulWidget {
  const AllCargoScreenScreen({super.key, required this.tripNum});

  final int? tripNum;

  @override
  State<AllCargoScreenScreen> createState() => _AllCargoScreenScreenState();
}

class _AllCargoScreenScreenState extends State<AllCargoScreenScreen> {
  AllCargoScreenController controller = Get.put(AllCargoScreenController());
  SearchcargoController searchcontroller = Get.put(SearchcargoController());
  final TripSheetController tripSheetController =
      Get.put(TripSheetController());
  bool isLodingmore = false;
  int page = 0;
  // List<CargoData> cargoaddedList = <CargoData>[];

  final scrollcontroller = ScrollController();
  void clearimage() {
    controller.imagePath.value = null;
    controller.cropedfile.value = null;
  }

  //lock

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      page = 0;
    });
    searchcontroller.trpid.value = widget.tripNum!;

    // controller.getcargocontroller.cargoaddedList.clear();

    scrollcontroller.addListener(_scrollListner);

    controller.getcargocontroller.getCargos(widget.tripNum!, page);

    // // controller.getcargocontroller.cargoaddedList = controller.getcargocontroller.cargoaddedList + controller.cargoList;

    clearimage();
  }

  void _scrollListner() async {
    if (isLodingmore == true) return;
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      setState(() {
        isLodingmore = true;
        if (controller.getcargocontroller.cargoList.length != 0) {
          page = page + 10;
        }
      });

      await controller.getcargocontroller.getCargos(widget.tripNum!, page);
      // cargoaddedList = cargoaddedList + controller.cargoList;

      log(page.toString());
      log("scrolled+");
      setState(() {
        isLodingmore = false;
      });
    }
    // else if (scrollcontroller.position.pixels ==
    //     scrollcontroller.position.minScrollExtent) {
    //   setState(() {
    //     isLodingmore = true;
    //   });
    //   page = page - 10;
    //   await controller.getcargocontroller.getCargos(
    //       "2|AhjfNi38T0hkrw2f7UtDhdbyqBQAkKGhupbyEAoP47e54c1a",
    //       widget.tripNum!,
    //       page);
    //   // cargoaddedList = cargoaddedList + controller.cargoList;

    //   print("call");
    //   log("scrolled-");
    //   log(page.toString());
    //   setState(() {
    //     isLodingmore = false;
    //   });
    // }
    else {
      log("scrolling");
    }
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
      0: const Color(0xff9fa6b2),
      1: const Color(0xff3b71ca),
      2: const Color(0xff54b4d3),
      3: const Color(0xff14a44d),
      4: const Color(0xffe4a11b),
      5: const Color(0xffdc4c64),
      6: const Color(0xffdc4c64),
    };

    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(controller.selectedValue.value, statusMap),
            body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 25.v,
                    right: 16.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Obx(() => Container(
                      //       // width: 380.h,
                      //       height: 50.v,
                      //       decoration: BoxDecoration(
                      //           color: appTheme.blueGray100,
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(15.h))),
                      //       child: Center(
                      //           child: DropdownButton<int>(
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontWeight: FontWeight.w600),
                      //         dropdownColor: Colors.white,
                      //         focusColor: Colors.black,
                      //         value: controller.selectedValue.value,
                      //         onChanged: (int? newValue) {
                      //           if (newValue != null) {
                      //             controller.selectedValue.value = newValue;
                      //             log(controller.selectedValue.value
                      //                 .toString());
                      //           }
                      //         },
                      //         items: statusMap.entries
                      //             .map<DropdownMenuItem<int>>(
                      //                 (MapEntry<int, String> entry) {
                      //           return DropdownMenuItem<int>(
                      //             value: entry.key,
                      //             child: Text(entry.value),
                      //           );
                      //         }).toList(),
                      //       )),
                      //     )),
                      // SizedBox(
                      //   height: 10.v,
                      // ),
                      // CustomTextFormField(
                      //   autofocus: false,
                      //   controller: controller.commentController,
                      //   hintText: "lbl_comments".tr,
                      //   textInputAction: TextInputAction.done,
                      //   contentPadding: EdgeInsets.symmetric(
                      //     horizontal: 20.h,
                      //     vertical: 16.v,
                      //   ),
                      //   borderDecoration: TextFormFieldStyleHelper.fillBlueGray,
                      //   fillColor: appTheme.blueGray100,
                      // ),
                      // SizedBox(
                      //   height: 10.v,
                      // ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          controller: searchcontroller.searchController,
                          decoration: InputDecoration(
                            fillColor: Colors.black,
                            hintText: 'Type here...',
                          ),
                        ),
                      ),
                      SizedBox(height: 15.v),

                      Obx(() => Center(
                            child: Text(
                              "Total Cargo ${controller.getcargocontroller.cargoaddedList.length}",
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                      SizedBox(
                        height: 15.v,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     InkWell(
                      //       onTap: () {},
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.black)),
                      //         height: 30.v,
                      //         width: 85.h,
                      //         child: Center(child: Text('Preveous')),
                      //       ),
                      //     ),
                      //     InkWell(
                      //       onTap: () {},
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.black)),
                      //         height: 30.v,
                      //         width: 85.h,
                      //         child: Center(child: Text('Next')),
                      //       ),
                      //     )
                      //   ],
                      // ),

                      Obx(
                        () => controller.getcargocontroller.isLoading.value &&
                                page == 1
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : controller
                                    .getcargocontroller.cargoaddedList.isEmpty
                                ? Padding(
                                    padding: EdgeInsets.only(top: 10.v),
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            const shimmerwidget(),
                                        itemCount: 3),
                                  )
                                : SizedBox(
                                    height: 600.v,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 20.v),
                                      child: RefreshIndicator(
                                        onRefresh: () async {
                                          page = 0;
                                          searchcontroller.page1.value = page;
                                          searchcontroller.searching.value =
                                              false;
                                          log("hlo");
                                          controller
                                              .getcargocontroller.cargoaddedList
                                              .clear();
                                          controller.getcargocontroller
                                              .getCargos(widget.tripNum!, page);
                                          log("refresh");
                                        },
                                        child: ListView.builder(
                                          controller: scrollcontroller,
                                          // shrinkWrap: true,
                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          itemCount: controller
                                                  .getcargocontroller
                                                  .isLoading
                                                  .value
                                              ? controller.getcargocontroller
                                                      .cargoaddedList.length +
                                                  1
                                              : controller.getcargocontroller
                                                  .cargoaddedList.length,
                                          itemBuilder: (context, index) {
                                            if (index <
                                                controller.getcargocontroller
                                                    .cargoaddedList.length) {
                                              CargoData model = controller
                                                  .getcargocontroller
                                                  .cargoaddedList[index];
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15.v),
                                                child: LongPressDraggable(
                                                  data: model,
                                                  feedback:
                                                      ThirteenlistItemWidget(
                                                    statusMap: statusMap,
                                                    colorMap: ColorMap,
                                                    cargoData: model,
                                                    onSelectionChanged:
                                                        (isSelected) {
                                                      controller
                                                          .toggleSelection(
                                                              model);
                                                    },
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(
                                                              MaterialPageRoute(
                                                        builder: (context) =>
                                                            CargoDeatailsScreen(
                                                          model,
                                                          tripNum:
                                                              widget.tripNum,
                                                          page: page,
                                                        ),
                                                      ));
                                                    },
                                                    child:
                                                        ThirteenlistItemWidget(
                                                      statusMap: statusMap,
                                                      colorMap: ColorMap,
                                                      cargoData: model,
                                                      onSelectionChanged:
                                                          (isSelected) {
                                                        controller
                                                            .toggleSelection(
                                                                model);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              _image(),
              SizedBox(
                width: 40.h,
              ),
              _menu(),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: Card(
          //     elevation: 4.0,
          //     child: Padding(
          //       padding: EdgeInsets.all(16.0),
          //       child: _image(),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 24.0),
          // _menu(),
        ],
      ),
    );
  }

  Widget _image() {
    if (controller.cropedfile.value != null) {
      final path = controller.cropedfile.value!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 200.h,
          maxHeight: 200.v,
        ),
        child: Image.file(File(path)),
      );
    } else if (controller.imagePath.value != null) {
      final path = controller.imagePath.value!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 200.h,
          maxHeight: 200.v,
        ),
        child: Image.file(File(path)),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _menu() {
    return Column(
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
        SizedBox(
          height: 10.v,
        ),
        if (controller.cropedfile.value == null)
          FloatingActionButton(
            onPressed: () async {
              await controller.cropImage();
            },
            backgroundColor: const Color(0xFFBC764A),
            tooltip: 'Crop',
            child: const Icon(Icons.crop),
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
        height: 260.0,
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
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
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
                          style: const TextStyle(color: Colors.black),
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
  PreferredSizeWidget _buildAppBar(
      int selectValue, Map<int, String> statusMap) {
    back() {
      log("back");
      searchcontroller.searchController.clear();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AllCargoScreenScreen(tripNum: widget.tripNum),
      ));
    }

    AllCargoScreenController controller = Get.put(AllCargoScreenController());
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: AppbarLeadingImage(
        onTap: () {
          //assdfgfgfd
          log("back");
          searchcontroller.searchController.clear();
          tripSheetController.tripsheetaddedList.clear();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AllTripsheetScreen(),
          ));

          controller.selectedCargoItems.clear();
          controller.cargoIds.value = "";
          log(controller.selectedCargoItems.length.toString());
        },
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
        // InkWell(
        //     onTap: () {
        //       controller.getcargocontroller.cargoaddedList.clear();
        //       setState(() {
        //         page = 0;
        //       });

        //       controller.getcargocontroller.getCargos(widget.tripNum!, 0);
        //     },
        //     child: Icon(Icons.refresh)),
        SizedBox(
          width: 15.h,
        ),
        Padding(
          padding: EdgeInsets.only(top: 36.v, right: 30.h),
          child: InkWell(
            child: const Text("Change Status"),
            onTap: () async {
              showModalBottomSheet(
                enableDrag: true,
                backgroundColor: const Color.fromARGB(0, 255, 193, 7),
                context: context,
                builder: (BuildContext context) {
                  return Obx(() => AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: controller.selectedValue == 3 ? 530.v : 250.v,
                        decoration: const BoxDecoration(
                            color: Color(0xff9356a0),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20.h,
                            right: 20.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 30.v),
                              Obx(() => Container(
                                    // width: 380.h,
                                    height: 50.v,
                                    decoration: BoxDecoration(
                                        color: appTheme.blueGray100,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.h))),
                                    child: Center(
                                        child: DropdownButton<int>(
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                      dropdownColor: Colors.white,
                                      focusColor: Colors.black,
                                      value: controller.selectedValue.value,
                                      onChanged: (int? newValue) {
                                        if (newValue != null) {
                                          controller.selectedValue.value =
                                              newValue;
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
                                height: 10.v,
                              ),
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
                              SizedBox(
                                height: 10.v,
                              ),
                              Obx(() => controller.selectedValue == 3
                                  ? _body()
                                  : const SizedBox()),
                              SizedBox(
                                height: 15.v,
                              ),
                              controller.selectedValue != 3
                                  ? CustomElevatedButton(
                                      height: 36.v,
                                      width: 148.h,
                                      text: "Update",
                                      buttonStyle: ButtonStyle(
                                        textStyle:
                                            const MaterialStatePropertyAll(
                                                TextStyle(
                                          color: Colors.white,
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                appTheme.indigo800),
                                      ),
                                      onPressed: () async {
                                        log(controller.selectedValue.value
                                            .toString());
                                        if (controller.selectedValue.value !=
                                            3) {
                                          await controller
                                              .updateStatuscontroller
                                              .updateCargoStatus(
                                                  authtoken: "",
                                                  cargoIds:
                                                      controller.cargoIds.value,
                                                  statusId: controller
                                                      .selectedValue.value);
                                        } else {
                                          if (controller.cropedfile.value !=
                                              null) {
                                            final path = controller
                                                .cropedfile.value!.path;
                                            await controller.updateController
                                                .updateCargoStatusWithAttachment(
                                                    File(path),
                                                    controller
                                                        .selectedValue.value,
                                                    controller.cargoIds.value);
                                          } else {
                                            final path = controller
                                                .imagePath.value!.path;
                                            await controller.updateController
                                                .updateCargoStatusWithAttachment(
                                                    File(path),
                                                    controller
                                                        .selectedValue.value,
                                                    controller.cargoIds.value);
                                          }
                                        }
                                        controller
                                            .getcargocontroller.cargoaddedList
                                            .clear();
                                        setState(() {
                                          page = 0;
                                        });

                                        controller.getcargocontroller
                                            .getCargos(widget.tripNum!, 0);
                                        controller.cargoIds.value = '';
                                        controller.imagePath.value = null;
                                        controller.cropedfile.value = null;

                                        // await controller.updateStatuscontroller
                                        //     .updateCargoStatus(
                                        //         authtoken: "",
                                        //         cargoIds: controller.cargoIds.value,
                                        //         statusId: controller.selectedValue.value)
                                        //     .then((value) => controller.getcargocontroller.getCargos(

                                        //         widget.tripNum!)
                                        //         );
                                      },
                                      // buttonTextStyle:
                                      //     theme.textTheme.bodyLarge!,
                                    )
                                  : const SizedBox(),
                              controller.cropedfile.value != null ||
                                      controller.imagePath.value != null
                                  ? CustomElevatedButton(
                                      height: 36.v,
                                      width: 148.h,
                                      text: "Update",
                                      buttonStyle: ButtonStyle(
                                        textStyle:
                                            const MaterialStatePropertyAll(
                                                TextStyle(
                                          color: Colors.white,
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                appTheme.indigo800),
                                      ),
                                      onPressed: () async {
                                        log(controller.selectedValue.value
                                            .toString());
                                        if (controller.selectedValue.value !=
                                            3) {
                                          await controller
                                              .updateStatuscontroller
                                              .updateCargoStatus(
                                                  authtoken: "",
                                                  cargoIds:
                                                      controller.cargoIds.value,
                                                  statusId: controller
                                                      .selectedValue.value);
                                        } else {
                                          if (controller.cropedfile.value !=
                                              null) {
                                            final path = controller
                                                .cropedfile.value!.path;
                                            await controller.updateController
                                                .updateCargoStatusWithAttachment(
                                                    File(path),
                                                    controller
                                                        .selectedValue.value,
                                                    controller.cargoIds.value);
                                          } else {
                                            final path = controller
                                                .imagePath.value!.path;
                                            await controller.updateController
                                                .updateCargoStatusWithAttachment(
                                                    File(path),
                                                    controller
                                                        .selectedValue.value,
                                                    controller.cargoIds.value);
                                          }
                                        }
                                        controller
                                            .getcargocontroller.cargoaddedList
                                            .clear();
                                        setState(() {
                                          page = 0;
                                        });

                                        controller.getcargocontroller
                                            .getCargos(widget.tripNum!, 0);
                                        controller.cargoIds.value = '';
                                        controller.imagePath.value = null;
                                        controller.cropedfile.value = null;

                                        // await controller.updateStatuscontroller
                                        //     .updateCargoStatus(
                                        //         authtoken: "",
                                        //         cargoIds: controller.cargoIds.value,
                                        //         statusId: controller.selectedValue.value)
                                        //     .then((value) => controller.getcargocontroller.getCargos(

                                        //         widget.tripNum!)
                                        //         );
                                      },
                                      // buttonTextStyle:
                                      //     theme.textTheme.bodyLarge!,
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ));
                },
              );

              // log(controller.selectedValue.value.toString());
              // if (controller.selectedValue.value != 3) {
              //   await controller.updateStatuscontroller.updateCargoStatus(
              //       authtoken: "",
              //       cargoIds: controller.cargoIds.value,
              //       statusId: controller.selectedValue.value);
              // } else {
              //   if (controller.cropedfile.value != null) {
              //     final path = controller.cropedfile.value!.path;
              //     await controller.updateController
              //         .updateCargoStatusWithAttachment(
              //             File(path),
              //             controller.selectedValue.value,
              //             controller.cargoIds.value);
              //   } else {
              //     final path = controller.imagePath.value!.path;
              //     await controller.updateController
              //         .updateCargoStatusWithAttachment(
              //             File(path),
              //             controller.selectedValue.value,
              //             controller.cargoIds.value);
              //   }
              // }
              // controller.getcargocontroller.cargoaddedList.clear();
              // setState(() {
              //   page = 0;
              // });

              // controller.getcargocontroller.getCargos(

              //     widget.tripNum!,
              //     0);
              // controller.cargoIds.value = '';
              // controller.imagePath.value = null;
              // controller.cropedfile.value = null;

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

class shimmerwidget extends StatelessWidget {
  const shimmerwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 15.v,
      ),
      child: SizedBox(
        width: 350.0,
        height: 50.0,
        child: Shimmer.fromColors(
            baseColor: const Color.fromARGB(129, 158, 158, 158),
            highlightColor: Colors.white,
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: 320.h,
                  height: 50.v,
                  child: Row(
                    children: [
                      Container(
                        height: 20.v,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
