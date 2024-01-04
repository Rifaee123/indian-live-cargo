import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/image_constant.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';
import 'package:indian_live_cargo_mobileapp/theme/app_decoration.dart';
import 'package:indian_live_cargo_mobileapp/theme/custom_text_style.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_elevated_button.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_image_view.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_text_form_field.dart';
import 'controller/android_large_eleven_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AndroidLargeElevenScreen extends GetWidget<AndroidLargeElevenController> {
  const AndroidLargeElevenScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'Value 1';
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
                      _buildRightArrowZipcode(),
                      SizedBox(height: 25.v),
                      SizedBox(
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 450.v,
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
                                    Container(
                                      width: 320.h,
                                      height: 50.v,
                                      decoration: BoxDecoration(
                                          color: appTheme.blueGray100,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.h))),
                                      child: Center(
                                        child: DropdownButton<String>(
                                          dropdownColor: Colors.black,
                                          value: selectedValue,
                                          onChanged: (String? newValue) {
                                            selectedValue = newValue!;
                                          },
                                          items: <String>[
                                            'Value 1',
                                            'Value 2',
                                            'Value 3',
                                            'Value 4',
                                            'Value 5'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 32.v),
                                    CustomTextFormField(
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
                                    CustomElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor: const Color.fromARGB(
                                              0, 255, 193, 7),
                                          context: context,
                                          builder: (context) => Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xff1f4399),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(50),
                                                    topRight:
                                                        Radius.circular(50))),
                                            height: 190.v,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 4.h,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .openCamera();
                                                            },
                                                            child: Container(
                                                              height: 60.v,
                                                              width: 67.h,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: appTheme
                                                                    .blueGray100,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  10.h,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height: 13.v),
                                                          Text(
                                                            "lbl_camara".tr,
                                                            style: CustomTextStyles
                                                                .titleMediumSemiBold,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.only(),
                                                      child: Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .openGallery();
                                                            },
                                                            child: Container(
                                                              height: 60.v,
                                                              width: 69.h,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: appTheme
                                                                    .blueGray100,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  10.h,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height: 14.v),
                                                          Text(
                                                            "lbl_gallery".tr,
                                                            style: CustomTextStyles
                                                                .titleMediumSemiBold,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      height: 36.v,
                                      width: 148.h,
                                      text: "lbl_add_docs".tr,
                                      buttonStyle:
                                          CustomButtonStyles.fillBlueGray,
                                      buttonTextStyle:
                                          theme.textTheme.bodyLarge!,
                                    ),
                                    SizedBox(height: 26.v),
                                  ],
                                ),
                              ),
                            ),
                            // Align(
                            //   alignment: Alignment.bottomCenter,
                            //   child: Container(
                            //     width: double.maxFinite,
                            //     margin: EdgeInsets.only(top: 313.v),
                            //     padding: EdgeInsets.symmetric(
                            //       horizontal: 67.h,
                            //       vertical: 48.v,
                            //     ),
                            //     decoration: BoxDecoration(
                            //       borderRadius:
                            //           BorderRadiusStyle.customBorderTL501,
                            //     ),
                            // child: Row(
                            //   mainAxisAlignment:
                            //       MainAxisAlignment.spaceBetween,
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Padding(
                            //       padding: EdgeInsets.only(
                            //         left: 4.h,
                            //         bottom: 305.v,
                            //       ),
                            //       child: Column(
                            //         children: [
                            //           Container(
                            //             height: 60.v,
                            //             width: 67.h,
                            //             decoration: BoxDecoration(
                            //               color: appTheme.blueGray100,
                            //               borderRadius:
                            //                   BorderRadius.circular(
                            //                 10.h,
                            //               ),
                            //             ),
                            //           ),
                            //           SizedBox(height: 13.v),
                            //           Text(
                            //             "lbl_camara".tr,
                            //             style: CustomTextStyles
                            //                 .titleMediumSemiBold,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     Padding(
                            //       padding: EdgeInsets.only(bottom: 303.v),
                            //       child: Column(
                            //         children: [
                            //           Container(
                            //             height: 60.v,
                            //             width: 69.h,
                            //             decoration: BoxDecoration(
                            //               color: appTheme.blueGray100,
                            //               borderRadius:
                            //                   BorderRadius.circular(
                            //                 10.h,
                            //               ),
                            //             ),
                            //           ),
                            //           SizedBox(height: 14.v),
                            //           Text(
                            //             "lbl_gallery".tr,
                            //             style: CustomTextStyles
                            //                 .titleMediumSemiBold,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            //   ),
                            // ),
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
  Widget _buildRightArrowZipcode() {
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
                    Get.offNamed(
                      AppRoutes.androidLargeTenScreen,
                    );
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgRightArrow,
                    height: 44.adaptSize,
                    width: 44.adaptSize,
                  ),
                ),
                SizedBox(height: 10.v),
                Text(
                  "lbl_163212".tr,
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
                        "msg_sheeba_charumoodu".tr,
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
}
