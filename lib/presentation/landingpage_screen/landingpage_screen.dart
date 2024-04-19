import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/image_constant.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';
import 'package:indian_live_cargo_mobileapp/theme/app_decoration.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_elevated_button.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_icon_button.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_image_view.dart';

import 'controller/landingpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class LandingpageScreen extends GetWidget<LandingpageController> {
  const LandingpageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildIndianLiveCargo(),
              SizedBox(height: 75.v),
              _buildTripsheet(),
              SizedBox(height: 39.v),
              _buildContact(),
              SizedBox(height: 20.v),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/images/icons8-instagram-48.png"),
                      Image.asset("assets/images/icons8-facebook-48.png"),
                      Image.asset("assets/images/icons8-whatsapp-48.png")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildIndianLiveCargo() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 21.v,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.customBorderBR100,
        image: DecorationImage(
          image: AssetImage(ImageConstant.imgGroup10),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 41.v),
          Padding(
            padding: EdgeInsets.only(left: 23.h),
            child: Text(
              "Indian Live Cargo",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 40.v),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 162.v,
              width: 321.h,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  CustomImageView(
                    imagePath:
                        "assets/images/techny-international-transportation-and-delivery-logistics.gif",
                    height: 162.adaptSize,
                    width: 162.adaptSize,
                    alignment: Alignment.centerRight,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 95.v,
                      width: 168.h,
                      margin: EdgeInsets.only(top: 3.v),
                      padding: EdgeInsets.symmetric(
                        horizontal: 41.h,
                        vertical: 16.v,
                      ),
                      decoration: AppDecoration.fillWhiteA.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder30,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgCargologo11,
                        height: 57.v,
                        width: 84.h,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTripsheet() {
    return SizedBox(
      height: 105.v,
      width: 299.h,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 105.v,
              width: 109.h,
              padding: EdgeInsets.symmetric(
                horizontal: 23.h,
                vertical: 21.v,
              ),
              decoration: AppDecoration.fillPurple.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: CustomIconButton(
                height: 62.adaptSize,
                width: 62.adaptSize,
                padding: EdgeInsets.all(10.h),
                alignment: Alignment.center,
                child: CustomImageView(
                  imagePath: ImageConstant.imgGroup4,
                ),
              ),
            ),
          ),
          CustomElevatedButton(
            onPressed: () {
              Get.offNamed(
                AppRoutes.androidLargeNineScreen,
              );
            },
            buttonStyle: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color(0XFFF1C9FF),
                ),
                elevation: MaterialStatePropertyAll(0)),
            width: 210.h,
            text: "Tripsheet",
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildContact() {
    return SizedBox(
      height: 105.v,
      width: 299.h,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 105.v,
              width: 109.h,
              padding: EdgeInsets.symmetric(
                horizontal: 23.h,
                vertical: 21.v,
              ),
              decoration: AppDecoration.fillRedc.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: CustomIconButton(
                height: 62.adaptSize,
                width: 62.adaptSize,
                padding: EdgeInsets.all(10.h),
                alignment: Alignment.center,
                child: CustomImageView(
                  imagePath: ImageConstant.imgGroup2,
                ),
              ),
            ),
          ),
          CustomElevatedButton(
            onPressed: () {
              Get.offNamed(
                AppRoutes.contactPageScreen,
              );
            },
            buttonStyle: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color(0XFFED212A),
                ),
                elevation: MaterialStatePropertyAll(0)),
            width: 210.h,
            text: "Contact",
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }
}
