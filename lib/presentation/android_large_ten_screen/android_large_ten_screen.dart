import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/image_constant.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_ten_screen/controller/android_large_ten_controller.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_ten_screen/models/thirteenlist_item_model.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_ten_screen/widgets/thirteenlist_item_widget.dart';

import 'package:flutter/material.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/appbar_title.dart';
import 'package:indian_live_cargo_mobileapp/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class AndroidLargeTenScreen extends GetWidget<AndroidLargeTenController> {
  const AndroidLargeTenScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: EdgeInsets.only(
            left: 16.h,
            top: 25.v,
            right: 16.h,
          ),
          child: Obx(
            () => ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 12.v,
                );
              },
              itemCount: controller.androidLargeTenModelObj.value
                  .thirteenlistItemList.value.length,
              itemBuilder: (context, index) {
                ThirteenlistItemModel model = controller.androidLargeTenModelObj
                    .value.thirteenlistItemList.value[index];
                return InkWell(
                  onTap: () {
                    Get.offNamed(
                      AppRoutes.androidLargeElevenScreen,
                    );
                  },
                  child: ThirteenlistItemWidget(
                    model,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: AppbarLeadingImage(
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
    );
  }
}
