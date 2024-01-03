

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_nine_screen/models/android_large_nine_model.dart';

/// A controller class for the AndroidLargeNineScreen.
///
/// This class manages the state of the AndroidLargeNineScreen, including the
/// current androidLargeNineModelObj
class AndroidLargeNineController extends GetxController {
  Rx<AndroidLargeNineModel> androidLargeNineModelObj =
      AndroidLargeNineModel().obs;
}
