import 'dart:developer';

import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/image_constant.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/get_cargos_by_trip_no/get_cargos_by_trip_no.dart';
import 'package:indian_live_cargo_mobileapp/presentation/al_cargo_listing_screen/all_cargo_listing_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/all_cargo_screen.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/search_api/search_tripsheet_controller.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';
import 'package:indian_live_cargo_mobileapp/theme/app_decoration.dart';
import 'package:indian_live_cargo_mobileapp/theme/custom_text_style.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_image_view.dart';

import 'controller/all_tripsheet_screen_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AllTripsheetScreen extends StatefulWidget {
  const AllTripsheetScreen({Key? key}) : super(key: key);

  @override
  _AllTripsheetScreenState createState() => _AllTripsheetScreenState();
}

class _AllTripsheetScreenState extends State<AllTripsheetScreen> {
  final AllTripsheetScreenController controller =
      Get.put(AllTripsheetScreenController());
  final SearchController1 Searchcontroller = Get.put(SearchController1());
  Map<int, String> tripStatusMap = {
    7: 'Trip Created',
    0: 'On the Way',
    1: 'Trip Started',
    2: 'Trip Finished',
  };
  bool isLodingmore = false;
  int page = 0;
  @override
  void initState() {
    // TODO: implement initState
    page = 0;
    Searchcontroller.page1.value = page;
    controller.tripSheetController.fetchTripSheet(page);
    tripscrollcontroller.addListener(_scrollListner);
    super.initState();
  }

  final tripscrollcontroller = ScrollController();
  void _scrollListner() async {
    if (isLodingmore == true) return;
    if (tripscrollcontroller.position.pixels ==
        tripscrollcontroller.position.maxScrollExtent) {
      isLodingmore = true;
      if (controller.tripSheetController.tripSheetList.length != 0) {
        setState(() {
          page = page + 10;
        });
        Searchcontroller.page1.value = page;
        log(page.toString());
      }
      Searchcontroller.searching.value
          ? Searchcontroller.callApi(page)
          : await controller.tripSheetController.fetchTripSheet(page);
      // cargoaddedList = cargoaddedList + controller.cargoList;

      log(page.toString());
      log("scrolled+");
      setState(() {
        isLodingmore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<int, String> tripStatusMap = {
      7: 'Trip Created',
      0: 'On the Way',
      1: 'Trip Started',
      2: 'Trip Finished',
    };
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildIlcDelhi(),
              SizedBox(height: 24.v),
              Obx(() => Text(
                    "All_trip_sheet (${controller.tripSheetController.tripsheetaddedList.length})"
                        .tr,
                    style: CustomTextStyles.titleLargeBlack900,
                  )),
              SizedBox(height: 10.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: Searchcontroller.searchController,
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    hintText: 'Type here...',
                  ),
                ),
              ),
              SizedBox(height: 15.v),
              _buildAllTripSheet(tripStatusMap),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildIlcDelhi() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 29.v,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.customBorderBR100,
        image: DecorationImage(
          image: AssetImage(
            ImageConstant.imgGroup12,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.offNamed(
                AppRoutes.landingpageScreen,
              );
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgRightArrow,
              height: 44.adaptSize,
              width: 44.adaptSize,
            ),
          ),
          Text(
            "Indian Live Cargo",
            style: CustomTextStyles.headlineSmallWhiteA700,
          ),
          IconButton(
              onPressed: () {
                controller.tripSheetController.tripsheetaddedList.clear();
                controller.Logout();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  Widget _searchResult() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: SizedBox(
        height: 600.v,
        child: Obx(
          () => Searchcontroller.isLoading.value
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const shimmerwidget(),
                  itemCount: 3)
              : RefreshIndicator(
                  onRefresh: () async {
                    log("hlo");
                    controller.tripSheetController.tripsheetaddedList.clear();
                    await controller.tripSheetController.fetchTripSheet(10);
                  },
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: tripscrollcontroller,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: controller.tripSheetController.isLoading.value
                          ? controller.tripSheetController.tripsheetaddedList
                                  .length +
                              1
                          : controller
                              .tripSheetController.tripsheetaddedList.length,
                      itemBuilder: (context, index) {
                        if (index <
                            controller.tripSheetController.tripsheetaddedList
                                .length) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.getcargocontroller.cargoaddedList
                                      .clear();
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AllCargoScreenScreen(
                                        tripNum: controller.tripSheetController
                                            .tripsheetaddedList[index].id),
                                  ));
                                  // controller
                                  //     .tripSheetController.tripsheetaddedList
                                  //     .clear();
                                  // Get.offNamed(
                                  //   AppRoutes.androidLargeTenScreen,
                                  //   arguments: controller.tripSheetController
                                  //       .tripSheetList[index].tripNumber,
                                  // );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 5.h),
                                  decoration: AppDecoration.fillPurple.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder10,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(height: 18.v),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 17.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 69.v,
                                              width: 66.h,
                                              margin:
                                                  EdgeInsets.only(bottom: 3.v),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12.h,
                                                vertical: 11.v,
                                              ),
                                              decoration: AppDecoration
                                                  .fillWhiteA
                                                  .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder10,
                                              ),
                                              child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgIcons8Truck100,
                                                height: 42.adaptSize,
                                                width: 42.adaptSize,
                                                alignment:
                                                    Alignment.bottomCenter,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: 11.h,
                                                  top: 2.v,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 9.h),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            //jgfhg
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 1.v),
                                                              child: Text(
                                                                "lbl_trip_no"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .titleSmallBlack900,
                                                              ),
                                                              //hifhfgfg
                                                            ),
                                                            Text(
                                                              controller
                                                                  .tripSheetController
                                                                  .tripsheetaddedList[
                                                                      index]
                                                                  .tripSheetName
                                                                  .toString(),
                                                              style: theme
                                                                  .textTheme
                                                                  .titleSmall,
                                                            ),
                                                            //hi
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 6.v),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 7.h),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 1.v),
                                                            child: Text(
                                                              "Vehicle No :",
                                                              style: CustomTextStyles
                                                                  .titleSmallBlack900,
                                                            ),
                                                          ),
                                                          Text(
                                                            controller
                                                                .tripSheetController
                                                                .tripsheetaddedList[
                                                                    index]
                                                                .vehicleNumber
                                                                .toString(),
                                                            style: theme
                                                                .textTheme
                                                                .titleSmall,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 6.v),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Driver Mobile :",
                                                          style: CustomTextStyles
                                                              .titleSmallBlack900,
                                                        ),
                                                        Text(
                                                          controller
                                                              .tripSheetController
                                                              .tripsheetaddedList[
                                                                  index]
                                                              .vehicleDrivermobilenumber
                                                              .toString(),
                                                          style: theme.textTheme
                                                              .titleSmall,
                                                        ),
                                                        // Container(ioioui
                                                        //ygykkj
                                                        //   width: 102.h,
                                                        //   padding:
                                                        //       EdgeInsets.symmetric(
                                                        //     horizontal: 8.h,
                                                        //     vertical: 1.v,
                                                        //   ),
                                                        //   decoration: AppDecoration
                                                        //       .fillLightBlueA
                                                        //       .copyWith(
                                                        //     borderRadius:
                                                        //         BorderRadiusStyle
                                                        //             .roundedBorder5,
                                                        //   ),
                                                        //   child: Text(
                                                        //     "lbl_trip_created".tr,
                                                        //     style: theme
                                                        //         .textTheme.titleSmall,
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 11.v),
                                      Container(
                                        width: 325.h,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 45.h,
                                          vertical: 7.v,
                                        ),
                                        decoration: AppDecoration.fillIndigo800
                                            .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .customBorderBL10,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 100.h,
                                              child: Text(
                                                tripStatusMap[controller
                                                        .tripSheetController
                                                        .tripsheetaddedList[
                                                            index]
                                                        .status]
                                                    .toString(),
                                                style: CustomTextStyles
                                                    .titleSmallWhiteA700,
                                              ),
                                            ),
                                            Text(
                                              controller
                                                  .tripSheetController
                                                  .tripsheetaddedList[index]
                                                  .tripDate
                                                  .toString(),
                                              style: CustomTextStyles
                                                  .titleSmallWhiteA700,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.v,
                              )
                            ],
                          );
                        } else {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      }),
                ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAllTripSheet(Map<int, String> tripStatusMap) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: SizedBox(
        height: 540.v,
        child: Obx(
          () => controller.tripSheetController.tripsheetaddedList.isEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const shimmerwidget(),
                  itemCount: 3)
              : RefreshIndicator(
                  onRefresh: () async {
                    page = 0;
                    Searchcontroller.page1.value = page;
                    Searchcontroller.searching.value = false;
                    log("hlo");
                    controller.tripSheetController.tripsheetaddedList.clear();
                    await controller.tripSheetController.fetchTripSheet(page);
                  },
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: tripscrollcontroller,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: controller.tripSheetController.isLoading.value
                          ? controller.tripSheetController.tripsheetaddedList
                                  .length +
                              1
                          : controller
                              .tripSheetController.tripsheetaddedList.length,
                      itemBuilder: (context, index) {
                        if (index <
                            controller.tripSheetController.tripsheetaddedList
                                .length) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.getcargocontroller.cargoaddedList
                                      .clear();
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AllCargoScreenScreen(
                                        tripNum: controller.tripSheetController
                                            .tripsheetaddedList[index].id),
                                  ));
                                  // controller
                                  //     .tripSheetController.tripsheetaddedList
                                  //     .clear();
                                  // Get.offNamed(
                                  //   AppRoutes.androidLargeTenScreen,
                                  //   arguments: controller.tripSheetController
                                  //       .tripSheetList[index].tripNumber,
                                  // );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 5.h),
                                  decoration: AppDecoration.fillPurple.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder10,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(height: 18.v),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 17.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 69.v,
                                              width: 66.h,
                                              margin:
                                                  EdgeInsets.only(bottom: 3.v),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12.h,
                                                vertical: 11.v,
                                              ),
                                              decoration: AppDecoration
                                                  .fillWhiteA
                                                  .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder10,
                                              ),
                                              child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgIcons8Truck100,
                                                height: 42.adaptSize,
                                                width: 42.adaptSize,
                                                alignment:
                                                    Alignment.bottomCenter,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: 11.h,
                                                  top: 2.v,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 9.h),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            //jgfhg
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 1.v),
                                                              child: Text(
                                                                "lbl_trip_no"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .titleSmallBlack900,
                                                              ),
                                                              //hifhfgfg
                                                            ),
                                                            Text(
                                                              controller
                                                                  .tripSheetController
                                                                  .tripsheetaddedList[
                                                                      index]
                                                                  .tripSheetName
                                                                  .toString(),
                                                              style: theme
                                                                  .textTheme
                                                                  .titleSmall,
                                                            ),
                                                            //hi
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 6.v),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 7.h),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 1.v),
                                                            child: Text(
                                                              "Vehicle No :",
                                                              style: CustomTextStyles
                                                                  .titleSmallBlack900,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 100.v,
                                                            child: Text(
                                                              textAlign:
                                                                  TextAlign.end,
                                                              controller
                                                                  .tripSheetController
                                                                  .tripsheetaddedList[
                                                                      index]
                                                                  .vehicleNumber
                                                                  .toString(),
                                                              style: theme
                                                                  .textTheme
                                                                  .titleSmall,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 6.v),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Driver Mobile :",
                                                          style: CustomTextStyles
                                                              .titleSmallBlack900,
                                                        ),
                                                        Text(
                                                          controller
                                                              .tripSheetController
                                                              .tripsheetaddedList[
                                                                  index]
                                                              .vehicleDrivermobilenumber
                                                              .toString(),
                                                          style: theme.textTheme
                                                              .titleSmall,
                                                        ),
                                                        // Container(ioioui
                                                        //ygykkj
                                                        //   width: 102.h,
                                                        //   padding:
                                                        //       EdgeInsets.symmetric(
                                                        //     horizontal: 8.h,
                                                        //     vertical: 1.v,
                                                        //   ),
                                                        //   decoration: AppDecoration
                                                        //       .fillLightBlueA
                                                        //       .copyWith(
                                                        //     borderRadius:
                                                        //         BorderRadiusStyle
                                                        //             .roundedBorder5,
                                                        //   ),
                                                        //   child: Text(
                                                        //     "lbl_trip_created".tr,
                                                        //     style: theme
                                                        //         .textTheme.titleSmall,
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 11.v),
                                      Container(
                                        width: 325.h,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 45.h,
                                          vertical: 7.v,
                                        ),
                                        decoration: AppDecoration.fillIndigo800
                                            .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .customBorderBL10,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 100.h,
                                              child: Text(
                                                tripStatusMap[controller
                                                        .tripSheetController
                                                        .tripsheetaddedList[
                                                            index]
                                                        .status]
                                                    .toString(),
                                                style: CustomTextStyles
                                                    .titleSmallWhiteA700,
                                              ),
                                            ),
                                            Text(
                                              controller
                                                  .tripSheetController
                                                  .tripsheetaddedList[index]
                                                  .tripDate
                                                  .toString(),
                                              style: CustomTextStyles
                                                  .titleSmallWhiteA700,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.v,
                              )
                            ],
                          );
                        } else {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      }),
                ),
        ),
      ),
    );
  }
}
