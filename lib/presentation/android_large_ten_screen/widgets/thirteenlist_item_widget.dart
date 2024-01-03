import 'package:get/get_core/src/get_main.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/theme/app_decoration.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';

import '../controller/android_large_ten_controller.dart';
import '../models/thirteenlist_item_model.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ThirteenlistItemWidget extends StatelessWidget {
  ThirteenlistItemWidget(
    this.thirteenlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ThirteenlistItemModel thirteenlistItemModelObj;

  var controller = Get.find<AndroidLargeTenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.fillBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Obx(
              () => Text(
                thirteenlistItemModelObj.dynamicText!.value,
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 6.v,
              right: 4.h,
              bottom: 3.v,
            ),
            child: Obx(
              () => Text(
                thirteenlistItemModelObj.dynamicText1!.value,
                style: theme.textTheme.labelLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
