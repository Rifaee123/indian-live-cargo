import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/get_all_tripsheet_api/get_all_tripsheet_api.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/get_cargos_by_trip_no/get_cargos_by_trip_no.dart';
import 'package:indian_live_cargo_mobileapp/data/models/all_trip_sheet_model/datum.dart';
import 'package:indian_live_cargo_mobileapp/data/secure_storage.dart/secure_storage.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_tripsheet_screen/models/all_tripsheet_screen_model.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';

/// A controller class for the AllTripsheetScreenScreen.
///
/// This class manages the state of the AllTripsheetScreenScreen, including the
/// current AllTripsheetScreenModelObj
class AllTripsheetScreenController extends GetxController {
  
  final GetcargoController getcargocontroller = Get.put(GetcargoController());
  final TripSheetController tripSheetController =
      Get.put(TripSheetController());
  Rx<AllTripsheetScreenModel> AllTripsheetScreenModelObj =
      AllTripsheetScreenModel().obs;
  RxList<Datum> tripsheetlist = <Datum>[].obs;
  
  void Logout() async {
    await StorageService.instance
        .deleteAllSecureData()
        .then((value) => Get.offNamed(AppRoutes.androidLargeEightScreen));
  }

  
}
