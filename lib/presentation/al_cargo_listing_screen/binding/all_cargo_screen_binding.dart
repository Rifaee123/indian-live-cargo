import '../controller/all_cargo_screen_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AndroidLargeTenScreen.
///
/// This class ensures that the AndroidLargeTenController is created when the
/// AndroidLargeTenScreen is first loaded.
class AllCargoScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllCargoScreenController());
  }
}
