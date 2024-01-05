import '../controller/all_tripsheet_screen_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AndroidLargeNineScreen.
///
/// This class ensures that the AndroidLargeNineController is created when the
/// AndroidLargeNineScreen is first loaded.
class AllTripsheetScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllTripsheetScreenController());
  }
}
