import '../controller/android_large_eleven_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AndroidLargeElevenScreen.
///
/// This class ensures that the AndroidLargeElevenController is created when the
/// AndroidLargeElevenScreen is first loaded.
class AndroidLargeElevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AndroidLargeElevenController());
  }
}
