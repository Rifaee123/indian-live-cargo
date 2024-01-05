import '../controller/splash_screen_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AndroidLargeTwelveScreen.
///
/// This class ensures that the AndroidLargeTwelveController is created when the
/// AndroidLargeTwelveScreen is first loaded.
class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}
