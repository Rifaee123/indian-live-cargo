
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_eleven_screen/models/android_large_eleven_model.dart';

/// A controller class for the AndroidLargeElevenScreen.
///
/// This class manages the state of the AndroidLargeElevenScreen, including the
/// current androidLargeElevenModelObj
class AndroidLargeElevenController extends GetxController {
  TextEditingController editTextController = TextEditingController();

  TextEditingController commentController = TextEditingController();

  Rx<AndroidLargeElevenModel> androidLargeElevenModelObj =
      AndroidLargeElevenModel().obs;

  @override
  void onClose() {
    super.onClose();
    editTextController.dispose();
    commentController.dispose();
  }
}
