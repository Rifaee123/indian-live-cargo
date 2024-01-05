

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_tripsheet_screen/models/all_tripsheet_screen_model.dart';

/// A controller class for the AllTripsheetScreenScreen.
///
/// This class manages the state of the AllTripsheetScreenScreen, including the
/// current AllTripsheetScreenModelObj
class AllTripsheetScreenController extends GetxController {
  Rx<AllTripsheetScreenModel> AllTripsheetScreenModelObj =
      AllTripsheetScreenModel().obs;
}
