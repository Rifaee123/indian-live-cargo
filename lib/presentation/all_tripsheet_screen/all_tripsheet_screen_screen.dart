import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/image_constant.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';
import 'package:indian_live_cargo_mobileapp/theme/app_decoration.dart';
import 'package:indian_live_cargo_mobileapp/theme/custom_text_style.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_image_view.dart';

import 'controller/all_tripsheet_screen_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AllTripsheetScreen extends GetWidget<AllTripsheetScreenController> {
  const AllTripsheetScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildIlcDelhi(),
              SizedBox(height: 24.v),
              _buildAllTripSheet(),
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
        horizontal: 35.h,
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
      child: Text(
        "lbl_ilcdelhi".tr,
        style: CustomTextStyles.headlineSmallWhiteA700,
      ),
    );
  }

  /// Section Widget
  Widget _buildAllTripSheet() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_all_trip_sheet".tr,
            style: CustomTextStyles.titleLargeBlack900,
          ),
          SizedBox(height: 10.v),
          Obx(
            () => controller.tripSheetController.tripSheetList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        controller.tripSheetController.tripSheetList.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.offNamed(
                              AppRoutes.androidLargeTenScreen,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5.h),
                            decoration: AppDecoration.fillPurple.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(height: 18.v),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 17.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 69.v,
                                        width: 66.h,
                                        margin: EdgeInsets.only(bottom: 3.v),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.h,
                                          vertical: 11.v,
                                        ),
                                        decoration:
                                            AppDecoration.fillWhiteA.copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder10,
                                        ),
                                        child: CustomImageView(
                                          imagePath:
                                              ImageConstant.imgIcons8Truck100,
                                          height: 42.adaptSize,
                                          width: 42.adaptSize,
                                          alignment: Alignment.bottomCenter,
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
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 9.h),
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
                                                          "lbl_trip_no".tr,
                                                          style: CustomTextStyles
                                                              .titleSmallBlack900,
                                                        ),
                                                      ),
                                                      Text(
                                                        controller
                                                            .tripSheetController
                                                            .tripSheetList[
                                                                index]
                                                            .tripNumber
                                                            .toString(),
                                                        style: theme.textTheme
                                                            .titleSmall,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 6.v),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 7.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.v),
                                                      child: Text(
                                                        "lbl_trip_date".tr,
                                                        style: CustomTextStyles
                                                            .titleSmallBlack900,
                                                      ),
                                                    ),
                                                    Text(
                                                      controller
                                                          .tripSheetController
                                                          .tripSheetList[index]
                                                          .tripDate
                                                          .toString(),
                                                      style: theme
                                                          .textTheme.titleSmall,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 3.v),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: 3.v,
                                                      bottom: 2.v,
                                                    ),
                                                    child: Text(
                                                      "lbl_status".tr,
                                                      style: CustomTextStyles
                                                          .titleSmallBlack900,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 102.h,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 8.h,
                                                      vertical: 1.v,
                                                    ),
                                                    decoration: AppDecoration
                                                        .fillLightBlueA
                                                        .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder5,
                                                    ),
                                                    child: Text(
                                                      "lbl_trip_created".tr,
                                                      style: theme
                                                          .textTheme.titleSmall,
                                                    ),
                                                  ),
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
                                  decoration:
                                      AppDecoration.fillIndigo800.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.customBorderBL10,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 3.v),
                                      Text(
                                        "lbl_all_cargo".tr,
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
                    ),
                  ),
          ),
          SizedBox(height: 30.v),
        ],
      ),
    );
  }
}
