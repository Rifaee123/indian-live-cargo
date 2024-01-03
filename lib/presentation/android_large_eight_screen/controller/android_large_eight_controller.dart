
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_eight_screen/models/android_large_eight_model.dart';

/// A controller class for the AndroidLargeEightScreen.
///
/// This class manages the state of the AndroidLargeEightScreen, including the
/// current androidLargeEightModelObj
class AndroidLargeEightController extends GetxController {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<AndroidLargeEightModel> androidLargeEightModelObj =
      AndroidLargeEightModel().obs;

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
