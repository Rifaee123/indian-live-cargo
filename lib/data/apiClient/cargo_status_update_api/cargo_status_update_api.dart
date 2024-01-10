// controllers/update_cargo_status_controller.dart
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indian_live_cargo_mobileapp/data/models/cargo_status_update_response/cargo_status_update_response.dart';
import 'package:indian_live_cargo_mobileapp/data/secure_storage.dart/secure_storage.dart';

class UpdateCargoStatusController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> updateCargoStatus(
      String authtoken, List<int> cargoIds, int statusId) async {
    try {
      final authToken =
          await StorageService.instance.readSecureData('AuthToken');
      isLoading.value = true;
      final url =
          Uri.parse('https://api.indianlivecargo.com/api/v1/updateCargoStatus');
      final headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      };

      final body = jsonEncode({
        'cargo_id': cargoIds,
        'status_id': statusId,
      });
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        // Handle success, e.g., show a success message
        log(response.body.toString());
        final jsonResponse = jsonDecode(response.body);
        CargoStatusUpdateResponse.fromJson(jsonResponse);
        Get.snackbar('Success', 'Update Successfully',
            backgroundColor: Color.fromARGB(102, 76, 175, 79));
        print('Successfully updated cargo status');
      } else {
        throw 'Failed to update cargo status: ${response.body}';
      }
    } catch (error) {
      // Handle error, e.g., show an error message
      print('Error updating cargo status: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
