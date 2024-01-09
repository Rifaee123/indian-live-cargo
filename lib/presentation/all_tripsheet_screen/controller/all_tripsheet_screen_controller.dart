import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/get_all_tripsheet_api/get_all_tripsheet_api.dart';
import 'package:indian_live_cargo_mobileapp/data/models/all_trip_sheet_model/datum.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_tripsheet_screen/models/all_tripsheet_screen_model.dart';

/// A controller class for the AllTripsheetScreenScreen.
///
/// This class manages the state of the AllTripsheetScreenScreen, including the
/// current AllTripsheetScreenModelObj
class AllTripsheetScreenController extends GetxController {
  final TripSheetController tripSheetController =
      Get.put(TripSheetController());
  Rx<AllTripsheetScreenModel> AllTripsheetScreenModelObj =
      AllTripsheetScreenModel().obs;
  RxList<Datum> tripsheetlist = <Datum>[].obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    await tripSheetController
        .fetchTripSheet("2|AhjfNi38T0hkrw2f7UtDhdbyqBQAkKGhupbyEAoP47e54c1a");
    super.onInit();
  }
}
