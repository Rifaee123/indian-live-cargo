import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/data/secure_storage.dart/secure_storage.dart';
import 'package:indian_live_cargo_mobileapp/presentation/splash_screen/models/splash_screen_model.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';

/// A controller class for the SplashScreenScreen.
///
/// This class manages the state of the SplashScreenScreen, including the
/// current SplashScreenModelObj
class SplashScreenController extends GetxController {
  Rx<SplashScreenModel> SplashScreenModelObj = SplashScreenModel().obs;
  Future<bool> readAuthToken() async {
    bool? authToken;
    try {
      authToken =
          await StorageService.instance.containsKeyInSecureData('AuthToken');
      // Use the authToken for your authentication logic.
      print('Authentication Token: $authToken');
    } catch (e) {
      print('Error reading authentication token: $e');
    }
    return authToken!;
  }

  @override
  void onReady() async {
    bool authToken = await readAuthToken();

    if (authToken == true) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offNamed(
          AppRoutes.androidLargeNineScreen,
        );
      });
    } else {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offNamed(
          AppRoutes.androidLargeEightScreen,
        );
      });
    }
  }
}
