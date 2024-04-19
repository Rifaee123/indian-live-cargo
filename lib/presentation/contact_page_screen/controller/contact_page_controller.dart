import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:indian_live_cargo_mobileapp/presentation/contact_page_screen/models/contact_page_model.dart';

import 'package:flutter/material.dart';

/// A controller class for the ContactPageScreen.
///
/// This class manages the state of the ContactPageScreen, including the
/// current contactPageModelObj
class ContactPageController extends GetxController {
  TextEditingController cityController = TextEditingController();

  // Rx<ContactPageModel> contactPageModelObj = ContactPageModel(imagePath: ).obs;

  @override
  void onClose() {
    super.onClose();
    cityController.dispose();
  }
}
