import '../controller/android_large_ten_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AndroidLargeTenScreen.
///
/// This class ensures that the AndroidLargeTenController is created when the
/// AndroidLargeTenScreen is first loaded.
class AndroidLargeTenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AndroidLargeTenController());
  }
}
