// controllers/trip_sheet_controller.dart
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/get_cargos_by_trip_no.dart';
import 'package:indian_live_cargo_mobileapp/data/secure_storage.dart/secure_storage.dart';

class GetcargoController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CargoData> cargoList = <CargoData>[].obs;

  Future<void> getCargos(String authtoken, int cargoId) async {
    try {
      final authToken =
          await StorageService.instance.readSecureData('AuthToken');
      final String baseUrl = "https://api.indianlivecargo.com/api/v1";
      final url = Uri.parse('$baseUrl/trip_sheet/cargo/$cargoId');
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
         
        log(cargoList.length.toString());
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
