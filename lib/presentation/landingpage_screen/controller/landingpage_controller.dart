import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:indian_live_cargo_mobileapp/presentation/landingpage_screen/models/landingpage_model.dart';


/// A controller class for the LandingpageScreen.
///
/// This class manages the state of the LandingpageScreen, including the
/// current landingpageModelObj
class LandingpageController extends GetxController {
  Rx<LandingpageModel> landingpageModelObj = LandingpageModel().obs;
}
