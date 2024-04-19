import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/image_constant.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/presentation/contact_page_screen/controller/contact_page_controller.dart';
import 'package:indian_live_cargo_mobileapp/presentation/contact_page_screen/models/contact_page_model.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';
import 'package:indian_live_cargo_mobileapp/theme/app_decoration.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_elevated_button.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_icon_button.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_image_view.dart';

import 'package:flutter/material.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_text_form_field.dart';

class ContactPageScreen extends GetWidget<ContactPageController> {
  const ContactPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ContactPageModel> additionalViews = [
      ContactPageModel(imagePath: 'assets/images/cochin.png', text: "Cochin"),
      ContactPageModel(imagePath: 'assets/images/delhi.png', text: "Delhi"),
      ContactPageModel(imagePath: 'assets/images/calicut.png', text: "Calicut"),

      ContactPageModel(imagePath: 'assets/images/mumbai.png', text: "Mumbai"),
      // Add more items as needed
    ];
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: Column(children: [
                  _buildContactDetails(),
                  SizedBox(height: 15.v),
                  SizedBox(
                    height: 350.v,
                    child: ListView.builder(
                      itemCount: additionalViews.length,
                      itemBuilder: (context, index) =>
                          _buildAdditionalViews(additionalViews[index]),
                    ),
                  )
                ])))));
  }

  /// Section Widget
  Widget _buildContactDetails() {
    return SizedBox(
        height: 387.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          CustomImageView(
              imagePath: ImageConstant.imgGroup10,
              height: 317.v,
              width: 360.h,
              radius: BorderRadius.only(bottomRight: Radius.circular(100.h)),
              alignment: Alignment.topCenter),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
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
                  SizedBox(
                    width: 70.h,
                  ),
                  Text(
                    "contact",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 230.v,
                  width: 400.h,
                  margin: EdgeInsets.only(left: 42.h, right: 33.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 31.h, vertical: 10.v),
                  decoration: AppDecoration.fillGraya.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: Center(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.v),
                          Text("Web",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 74, 135),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 5.v),
                          GestureDetector(
                            onTap: () {
                              onTapTxtWeburl();
                            },
                            child: Text("www.indianlivecargo.com",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 74, 135),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300)),
                          ),
                          SizedBox(height: 5.v),
                          Text("Email",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 74, 135),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 6.v),
                          GestureDetector(
                            onTap: () {
                              onTapTxtWeburl1();
                            },
                            child: Text("indianlivecargo@gmail.com",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 74, 135),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300)),
                          ),
                          SizedBox(height: 7.v),
                          Text("Phone",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 74, 135),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 5.v),
                          GestureDetector(
                              onTap: () {
                                onTapTxtWeburl2();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 3.h),
                                child: Text("+91-8006835000",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 74, 135),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300)),
                              ))
                        ]),
                  )))
        ]));
  }

  /// Section Widget
  // Widget _buildUserInput() {
  //   return SizedBox(
  //       height: 197.v,
  //       width: 317.h,
  //       child: Stack(alignment: Alignment.topCenter, children: [
  //         Align(
  //             alignment: Alignment.bottomCenter,
  //             child: Container(
  //                 margin: EdgeInsets.only(right: 6.h),
  //                 padding:
  //                     EdgeInsets.symmetric(horizontal: 9.h, vertical: 16.v),
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadiusStyle.roundedBorder10),
  //                 child: Column(mainAxisSize: MainAxisSize.min, children: [
  //                   SizedBox(height: 49.v),
  //                   CustomImageView(
  //                       imagePath: ImageConstant.imgImage2,
  //                       height: 98.v,
  //                       width: 281.h)
  //                 ]))),
  //         CustomTextFormField(
  //             width: 311.h,
  //             controller: controller.cityController,
  //             hintText: "lbl_mumbai".tr,
  //             textInputAction: TextInputAction.done,
  //             alignment: Alignment.topCenter)
  //       ]));
  // }

  /// Section Widget
  Widget _buildAdditionalViews(ContactPageModel item) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.v),
      child: SizedBox(
          height: 227.v,
          width: 311.h,
          child: Stack(alignment: Alignment.topCenter, children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    child: CustomImageView(
                        imagePath: item.imagePath, height: 110.v, width: 281.h),
                    decoration: BoxDecoration(
                        color: appTheme.gray600,
                        borderRadius: BorderRadius.circular(18.h)))),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                    height: 64.v,
                    width: 311.h,
                    child: Center(
                      child: Text(
                        item.text,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: appTheme.purple50,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.h),
                            bottomRight: Radius.circular(20.h)))))
          ])),
    );
  }

  onTapTxtWeburl() {
    // TODO: implement Actions
  }

  onTapTxtWeburl1() {
    // TODO: implement Actions
  }

  onTapTxtWeburl2() {
    // TODO: implement Actions
  }
}
