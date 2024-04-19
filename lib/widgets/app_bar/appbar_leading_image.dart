import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:indian_live_cargo_mobileapp/core/app_export.dart';
import 'package:indian_live_cargo_mobileapp/core/utils/size_utils.dart';
import 'package:indian_live_cargo_mobileapp/data/apiClient/get_all_tripsheet_api/get_all_tripsheet_api.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/all_cargo_screen.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_cargo_screen/controller/all_cargo_screen_controller.dart';
import 'package:indian_live_cargo_mobileapp/routes/app_routes.dart';
import 'package:indian_live_cargo_mobileapp/widgets/custom_image_view.dart';

// ignore: must_be_immutable
class AppbarLeadingImage extends StatelessWidget {
  AppbarLeadingImage({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
    this.id,
  }) : super(
          key: key,
        );
  final int? id;
  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    AllCargoScreenController controller = Get.put(AllCargoScreenController());
    final TripSheetController tripSheetController =
        Get.put(TripSheetController());
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath,
          height: 44.adaptSize,
          width: 44.adaptSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
