import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/models/all_cargo_screen_model.dart';


/// A controller class for the AndroidLargeTenScreen.
///
/// This class manages the state of the AndroidLargeTenScreen, including the
/// current androidLargeTenModelObj
class AllCargoScreenController extends GetxController {
  Rx<AndroidLargeTenModel> androidLargeTenModelObj = AndroidLargeTenModel().obs;
}
