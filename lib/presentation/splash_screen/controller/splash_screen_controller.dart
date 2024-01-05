
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/presentation/splash_screen/models/splash_screen_model.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';


/// A controller class for the SplashScreenScreen.
///
/// This class manages the state of the SplashScreenScreen, including the
/// current SplashScreenModelObj
class SplashScreenController extends GetxController {
  Rx<SplashScreenModel> SplashScreenModelObj =
      SplashScreenModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.androidLargeEightScreen,
      );
    });
  }
}
