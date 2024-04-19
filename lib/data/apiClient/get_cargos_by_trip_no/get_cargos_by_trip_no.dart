// controllers/trip_sheet_controller.dart
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indian_live_cargo_mobileapp/data/models/all_trip_sheet_model/datum.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/get_cargos_by_trip_no.dart';
import 'package:indian_live_cargo_mobileapp/data/secure_storage.dart/secure_storage.dart';

class GetcargoController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CargoData> cargoList = <CargoData>[].obs;
  RxList<CargoData> cargoaddedList = <CargoData>[].obs;

  Future<void> getCargos(int cargoId, int page) async {
    try {
      final authToken =
          await StorageService.instance.readSecureData('AuthToken');

      final String baseUrl = "https://api.indianlivecargo.com/api/v1";
      final url = Uri.parse('$baseUrl/trip_sheet_cargo/$cargoId/false/$page');
      final headers = {
        'Authorization': 'Bearer $authToken',
      };
      isLoading.value = true;
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        log(response.body.toString());
        final List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
        cargoList.assignAll(
          jsonResponse.map((data) => CargoData.fromJson(data)).toList(),
        );
        // cargoList.sort((a, b) => a.trackingNo!.compareTo(b.trackingNo!));

        // Add only the unique items from cargoList to cargoaddedList
        cargoaddedList.addAll(cargoList);
        // for (var cargoData in cargoList) {
        //   if (!cargoaddedList.contains(cargoData)) {
        //     cargoaddedList.add(cargoData);
        //   }
        // }

        log(cargoList.length.toString());
        log(cargoaddedList.length.toString());
      } else {
        throw 'Failed to get trip sheet';
      }
    } catch (error) {
      log(error.toString());
      throw error.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
