import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indian_live_cargo_mobileapp/presentation/cargo_deatails_screen/models/cargo_deatails_model.dart';

class CargoDeatailsScreenController extends GetxController {
  TextEditingController editTextController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  Rx<XFile?> imagePath = Rx<XFile?>(null);
  Rx<CargoDeatailsScreenModel> androidLargeElevenModelObj =
      CargoDeatailsScreenModel().obs;
  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      imagePath.value = pickedImage;
      // Use the picked file (e.g., upload or display the image)
      print('Image from camera: ${imagePath.value!.path}');
    }
  }

  Future<void> openGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imagePath.value = pickedImage;
      // Use the picked file (e.g., upload or display the image)
      print('Image from gallery: ${imagePath.value!.path}');
    }
  }

  @override
  void onClose() {
    super.onClose();
    editTextController.dispose();
    commentController.dispose();
  }
}
