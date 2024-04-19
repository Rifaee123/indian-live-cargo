import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/cargo_status_update_api/cargo_status_update_api.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/get_cargos_by_trip_no/get_cargos_by_trip_no.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/update_status_with_image/update_status_with_image_api.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';

/// A controller class for the AndroidLargeTenScreen.
///
/// This class manages the state of the AndroidLargeTenScreen, including the
/// current androidLargeTenModelObj
class AllCargoScreenController extends GetxController {
  TextEditingController commentController = TextEditingController();
  RxList<CargoData> cargoList = <CargoData>[].obs;
  final GetcargoController getcargocontroller = Get.put(GetcargoController());
  final UpdateCargoStatusController updateStatuscontroller =
      Get.put(UpdateCargoStatusController());
  // CargoDeatailsScreenController updatecontroller =
  //     Get.put(CargoDeatailsScreenController());
  UpdateStatusWithImageController updateController =
      Get.put(UpdateStatusWithImageController());
  Rx<int> tripno = 0.obs;
  Rx<int?> tripNo = 0.obs;
  RxInt selectedValue = 0.obs;
  final arguments = Get.arguments;
  RxString cargoIds = "".obs;
  final RxList<CargoData> selectedCargoItems = <CargoData>[].obs;
  Rx<XFile?> imagePath = Rx<XFile?>(null);
  selectValueClear() {
    selectedCargoItems.clear();
    cargoIds.value = "";
  }

  void removeFromCargoIds(int id) {
    cargoIds.value = cargoIds.value
        .split(',')
        .where((cargoId) => cargoId != id.toString())
        .join(',');
  }

  void toggleSelection(CargoData cargoData) {
    if (selectedCargoItems.contains(cargoData) ||
        cargoIds.split(',').contains(cargoData.id.toString())) {
      selectedCargoItems.remove(cargoData);
      cargoIds.value = cargoIds
          .split(',')
          .where((cargoId) => cargoId != cargoData.id.toString())
          .join(',');
      log(cargoIds.value);
    } else {
      selectedCargoItems.add(cargoData);
      addToCargoIds(cargoData.id!);
      log(cargoData.id.toString());
      log(cargoIds.value);
    }
    log(selectedCargoItems.length.toString());
    log("cargo id:${cargoIds.value}");
    log(cargoIds.value);
  }

  void addToCargoIds(int id) {
    if (cargoIds.value.isEmpty) {
      cargoIds.value = "$id";
    } else {
      cargoIds.value = "$cargoIds,$id";
    }
  }

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

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   tripNo.value = arguments;

  //   getcargocontroller.getCargos(
  //       "2|AhjfNi38T0hkrw2f7UtDhdbyqBQAkKGhupbyEAoP47e54c1a", tripNo.value!);
  // }
}
