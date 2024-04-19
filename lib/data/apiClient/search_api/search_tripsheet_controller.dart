import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:indian_live_cargo_mobileapp/data/models/all_trip_sheet_model/datum.dart';
import 'package:indian_live_cargo_mobileapp/data/secure_storage.dart/secure_storage.dart';
import 'package:indian_live_cargo_mobileapp/presentation/all_tripsheet_screen/controller/all_tripsheet_screen_controller.dart';

import '../../../core/app_export.dart';

class SearchController1 extends GetxController {
  final AllTripsheetScreenController controller =
      Get.put(AllTripsheetScreenController());
  TextEditingController searchController = TextEditingController();
  String baseUrl = 'https://api.indianlivecargo.com/api/v1/trip_sheet/all/';
  RxString searchResult = ''.obs;
  RxBool searching = false.obs;
  RxBool isLoading = false.obs;
  RxList<Datum> tripSheetSearchList = <Datum>[].obs;
  RxList<Datum> tripsheetaddedSearchList = <Datum>[].obs;
  RxInt page1 = 0.obs;

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      _debounce(() {
        callApi(page1.value);
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

  void callApi(int page) async {
    searching.value = true;
    String searchString = searchController.text;
    isLoading(true);
    final authToken = await StorageService.instance.readSecureData('AuthToken');
    // Modify the API URL based on the search input
    String apiUrl =
        baseUrl + (searchString.isEmpty ? 'false' : searchString) + '/$page';
    final headers = {
      'Authorization': 'Bearer $authToken',
    };

    // Make the API call using the http package
    try {
      http.Response response =
          await http.get(Uri.parse(apiUrl), headers: headers);

      // Handle the API response here, update UI accordingly
      if (response.statusCode == 200) {
        controller.tripSheetController.tripsheetaddedList.clear();
        // Successful response, parse and update UI
        searchResult(response.body);
        log(response.body.toString());
        final List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
        tripSheetSearchList.assignAll(
          jsonResponse.map((data) => Datum.fromJson(data)).toList(),
        );
        for (var cargoData in tripSheetSearchList) {
          if (!controller.tripSheetController.tripsheetaddedList
              .contains(cargoData)) {
            controller.tripSheetController.tripsheetaddedList.add(cargoData);
          }
        }
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any exceptions that may occur during the API call
      print('Error: $error');
    } finally {
      isLoading(false);
    }
  }
}
