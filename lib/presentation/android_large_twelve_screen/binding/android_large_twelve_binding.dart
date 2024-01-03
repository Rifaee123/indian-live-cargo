import '../controller/android_large_twelve_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AndroidLargeTwelveScreen.
///
/// This class ensures that the AndroidLargeTwelveController is created when the
/// AndroidLargeTwelveScreen is first loaded.
class AndroidLargeTwelveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AndroidLargeTwelveController());
  }
}
