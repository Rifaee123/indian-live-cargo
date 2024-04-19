// controllers/trip_sheet_controller.dart
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indian_live_cargo_mobileapp/data/apiClient/get_cargos_by_trip_no/get_cargos_by_trip_no.dart';
import 'package:indian_live_cargo_mobileapp/data/models/all_trip_sheet_model/datum.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/cargo_data.dart';
import 'package:indian_live_cargo_mobileapp/data/models/get_cargos_by_trip_no/get_cargos_by_trip_no.dart';
import 'package:indian_live_cargo_mobileapp/data/secure_storage.dart/secure_storage.dart';

class SearchcargoController extends GetxController {
  String baseUrl = 'https://api.indianlivecargo.com/api/v1/trip_sheet_cargo/';
  RxString searchResult = ''.obs;
  RxBool searching = false.obs;
  RxBool isLoading = false.obs;
  RxList<CargoData> cargoList = <CargoData>[].obs;
  TextEditingController searchController = TextEditingController();
  RxInt page1 = 0.obs;
  final GetcargoController getcargocontroller = Get.put(GetcargoController());
  RxInt trpid=0.obs;
  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      _debounce(() {
        getCargos(trpid.value,page1.value);
      }, const Duration(milliseconds: 500));
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void _debounce(Function() onTap, Duration duration) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(duration, onTap);
  }

  Timer? _timer;

  Future<void> getCargos(int cargoId, int page) async {
    getcargocontroller.cargoaddedList.clear();
    String searchString = searchController.text;
    try {
      final authToken =
          await StorageService.instance.readSecureData('AuthToken');

      String apiUrl =
          "$baseUrl$cargoId/${searchString.isEmpty ? 'false' : searchString}/$page";
      log(apiUrl);

      final url = Uri.parse(apiUrl);
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

        // Add only the unique items from cargoList to cargoaddedList
        for (var cargoData in cargoList) {
          if (!getcargocontroller.cargoaddedList.contains(cargoData)) {
            getcargocontroller.cargoaddedList.add(cargoData);
          }
        }

        log(cargoList.length.toString());
        log(getcargocontroller.cargoaddedList.length.toString());
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
