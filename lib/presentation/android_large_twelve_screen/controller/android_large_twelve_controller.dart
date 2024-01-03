
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_twelve_screen/models/android_large_twelve_model.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';


/// A controller class for the AndroidLargeTwelveScreen.
///
/// This class manages the state of the AndroidLargeTwelveScreen, including the
/// current androidLargeTwelveModelObj
class AndroidLargeTwelveController extends GetxController {
  Rx<AndroidLargeTwelveModel> androidLargeTwelveModelObj =
      AndroidLargeTwelveModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.androidLargeEightScreen,
      );
    });
  }
}
