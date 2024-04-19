// controllers/trip_sheet_controller.dart
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indian_live_cargo_mobileapp/data/models/all_trip_sheet_model/datum.dart';
import 'package:indian_live_cargo_mobileapp/data/secure_storage.dart/secure_storage.dart';

class TripSheetController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Datum> tripSheetList = <Datum>[].obs;
  RxList<Datum> tripsheetaddedList = <Datum>[].obs;

  Future<void> fetchTripSheet(int page) async {
    try {
      final authToken =
          await StorageService.instance.readSecureData('AuthToken');
      // const String baseUrl = "https://api.indianlivecargo.com/api/v1/";
      isLoading.value = true;
      final url = Uri.parse(
          'https://api.indianlivecargo.com/api/v1/trip_sheet/all/false/$page');
      final headers = {
        'Authorization': 'Bearer $authToken',
      };
      log(url.toString());
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        log(response.body.toString());
        final List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
        tripSheetList.assignAll(
          jsonResponse.map((data) => Datum.fromJson(data)).toList(),
        );
        for (var cargoData in tripSheetList) {
          if (!tripsheetaddedList.contains(cargoData)) {
            tripsheetaddedList.add(cargoData);
          }
        }
      } else {
        throw 'Failed to fetch trip sheet';
      }
    } catch (error) {
      log(error.toString());
      throw error.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
