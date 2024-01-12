import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/cargo_status_update_api/cargo_status_update_api.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/controller/all_cargo_screen_controller.dart';
import 'package:indian_live_cargo_mobileapp/presentation/cargo_deatails_screen/models/cargo_deatails_model.dart';

class CargoDeatailsScreenController extends GetxController {
  TextEditingController editTextController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  AllCargoScreenController getcargocontroller =
      Get.put(AllCargoScreenController());
  UpdateCargoStatusController UpdatecargoStatuscontroller =
      Get.put(UpdateCargoStatusController());
  Rx<XFile?> imagePath = Rx<XFile?>(null);
  RxList cargoIds = [].obs;
  Rx<CargoDeatailsScreenModel> androidLargeElevenModelObj =
      CargoDeatailsScreenModel().obs;
  RxInt selectedValue = 0.obs;
  Rx<CroppedFile?> cropedfile = Rx<CroppedFile?>(null);
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

  Future<void> cropImage() async {
    if (imagePath.value != null) {
      var croppedFile = await ImageCropper().cropImage(
        sourcePath: imagePath.value!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (croppedFile != null) {
        cropedfile.value = croppedFile;
      }
    }
  }

  void clear() {
    imagePath.value = null;
    cropedfile.value = null;
  }

  @override
  void onClose() {
    super.onClose();
    editTextController.dispose();
    commentController.dispose();
  }
}
