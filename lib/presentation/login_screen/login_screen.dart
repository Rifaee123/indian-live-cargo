import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/image_constant.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/validation_functions.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/get_all_tripsheet_api/get_all_tripsheet_api.dart';
import 'package:indian_live_cargo_mobileapp/presentation/login_screen/controller/login_screen_controller.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';
import 'package:indian_live_cargo_mobileapp/theme/app_decoration.dart';
import 'package:indian_live_cargo_mobileapp/theme/theme_helper.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_image_view.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_text_form_field.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginScreenController> {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TripSheetController tripSheetController =
      Get.put(TripSheetController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 19.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 26.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgCargologo11,
                      height: 136.v,
                      width: 201.h,
                    ),
                    SizedBox(height: 78.v),
                    _buildLoginSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginSection() {
    return Container(
      margin: EdgeInsets.only(left: 3.h),
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 41.v,
      ),
      decoration: AppDecoration.fillIndigo.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text(
                "lbl_login".tr,
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ),
          SizedBox(height: 28.v),
          CustomTextFormField(
            autofocus: false,
            controller: controller.userNameController,
            hintText: "lbl_enter_user_name".tr,
            validator: (value) {
              if (!isText(value)) {
                return "err_msg_please_enter_valid_text".tr;
              }
              return null;
            },
          ),
          SizedBox(height: 36.v),
          CustomTextFormField(
            autofocus: false,
            controller: controller.passwordController,
            hintText: "lbl_enter_password".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: true,
          ),
          SizedBox(height: 40.v),
          CustomElevatedButton(
            onPressed: () async {
              if (controller.userNameController.text.isNotEmpty &&
                  controller.passwordController.text.isNotEmpty) {
                await controller
                    .login(controller.userNameController.text.trim(),
                        controller.passwordController.text.trim())
                    .then((value) async {
                  if (controller.loginController.user.value != null) {
                    Get.offNamed(
                      AppRoutes.landingpageScreen,
                    );
                  }
                }); /////////////////////////////////////////////////////////////////////////////////
              } else {
                Get.snackbar('Enter Something', 'Data Not enterd');
              }
            },
            width: 175.h,
            text: "lbl_login".tr,
          ),
          SizedBox(height: 17.v),
        ],
      ),
    );
  }
}
