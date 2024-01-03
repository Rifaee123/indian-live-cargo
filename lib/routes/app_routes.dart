
import 'package:get/get.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_eight_screen/android_large_eight_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_eight_screen/binding/android_large_eight_binding.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_eleven_screen/android_large_eleven_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_eleven_screen/binding/android_large_eleven_binding.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_nine_screen/android_large_nine_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_nine_screen/binding/android_large_nine_binding.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_ten_screen/android_large_ten_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_ten_screen/binding/android_large_ten_binding.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_twelve_screen/android_large_twelve_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/android_large_twelve_screen/binding/android_large_twelve_binding.dart';
import 'package:indian_live_cargo_mobileapp/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/app_navigation_screen/binding/app_navigation_binding.dart';

class AppRoutes {
  static const String androidLargeTwelveScreen = '/android_large_twelve_screen';

  static const String androidLargeEightScreen = '/android_large_eight_screen';

  static const String androidLargeNineScreen = '/android_large_nine_screen';

  static const String androidLargeTenScreen = '/android_large_ten_screen';

  static const String androidLargeElevenScreen = '/android_large_eleven_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: androidLargeTwelveScreen,
      page: () => AndroidLargeTwelveScreen(),
      bindings: [
        AndroidLargeTwelveBinding(),
      ],
    ),
    GetPage(
      name: androidLargeEightScreen,
      page: () => AndroidLargeEightScreen(),
      bindings: [
        AndroidLargeEightBinding(),
      ],
    ),
    GetPage(
      name: androidLargeNineScreen,
      page: () => AndroidLargeNineScreen(),
      bindings: [
        AndroidLargeNineBinding(),
      ],
    ),
    GetPage(
      name: androidLargeTenScreen,
      page: () => AndroidLargeTenScreen(),
      bindings: [
        AndroidLargeTenBinding(),
      ],
    ),
    GetPage(
      name: androidLargeElevenScreen,
      page: () => AndroidLargeElevenScreen(),
      bindings: [
        AndroidLargeElevenBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => AndroidLargeTwelveScreen(),
      bindings: [
        AndroidLargeTwelveBinding(),
      ],
    )
  ];
}
