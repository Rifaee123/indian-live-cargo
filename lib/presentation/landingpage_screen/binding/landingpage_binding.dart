import '../controller/landingpage_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LandingpageScreen.
///
/// This class ensures that the LandingpageController is created when the
/// LandingpageScreen is first loaded.
class LandingpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LandingpageController());
  }
}
