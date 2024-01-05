import 'package:flutter/material.dart';

import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/login_api/login_api.dart';
import 'package:indian_live_cargo_mobileapp/presentation/login_screen/models/login_screen_model.dart';

/// A controller class for the AndroidLargeEightScreen.
///
/// This class manages the state of the AndroidLargeEightScreen, including the
/// current androidLargeEightModelObj
class LoginScreenController extends GetxController {
  
  final AuthController loginController = Get.put(AuthController());
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LoginScreenModel> androidLargeEightModelObj = LoginScreenModel().obs;

  Future<void> login(String username, String password) async {
    await loginController.login(username, password);
  }

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
