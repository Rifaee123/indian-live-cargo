import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/image_constant.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_image_view.dart';

import 'controller/android_large_twelve_controller.dart';
import 'package:flutter/material.dart';


class AndroidLargeTwelveScreen extends GetWidget<AndroidLargeTwelveController> {
  const AndroidLargeTwelveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgCargologo11,
                          height: 136.v,
                          width: 201.h)
                    ]))));
  }
}
