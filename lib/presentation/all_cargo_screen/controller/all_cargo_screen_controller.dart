import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/cargo_status_update_api/cargo_status_update_api.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/get_cargos_by_trip_no/get_cargos_by_trip_no.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/models/all_cargo_screen_model.dart';
import 'package:indian_live_cargo_mobileapp/presentation/cargo_deatails_screen/controller/cargo_deatails_screen_controller.dart';

/// A controller class for the AndroidLargeTenScreen.
///
/// This class manages the state of the AndroidLargeTenScreen, including the
/// current androidLargeTenModelObj
class AllCargoScreenController extends GetxController {
  RxList<CargoData> cargoList = <CargoData>[].obs;
  final GetcargoController getcargocontroller = Get.put(GetcargoController());
  final UpdateCargoStatusController updateStatuscontroller =
      Get.put(UpdateCargoStatusController());
  // CargoDeatailsScreenController updatecontroller =
  //     Get.put(CargoDeatailsScreenController());
  Rx<int> tripno = 0.obs;
  Rx<int?> tripNo = 0.obs;
  RxInt selectedValue = 0.obs;
  final arguments = Get.arguments;
  List<int> cargoIds = [];
  final RxList<CargoData> selectedCargoItems = <CargoData>[].obs;

  void toggleSelection(CargoData cargoData) {
    if (selectedCargoItems.contains(cargoData) &&
        cargoIds.contains(cargoData.id!)) {
      selectedCargoItems.remove(cargoData);
      cargoIds.remove(cargoData.id!);
    } else {
      selectedCargoItems.add(cargoData);
      cargoIds.add(cargoData.id!);
    }
    log(selectedCargoItems.length.toString());
    log("cargo id:${cargoIds.length.toString()}");
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
