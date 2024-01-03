import '../controller/android_large_eight_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AndroidLargeEightScreen.
///
/// This class ensures that the AndroidLargeEightController is created when the
/// AndroidLargeEightScreen is first loaded.
class AndroidLargeEightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AndroidLargeEightController());
  }
}
