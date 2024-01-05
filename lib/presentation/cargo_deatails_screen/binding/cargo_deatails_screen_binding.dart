import '../controller/cargo_deatails_screen_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AndroidLargeElevenScreen.
///
/// This class ensures that the AndroidLargeElevenController is created when the
/// AndroidLargeElevenScreen is first loaded.
class CargoDeatailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CargoDeatailsScreenController());
  }
}
