// controllers/update_cargo_status_controller.dart
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indian_live_cargo_mobileapp/data/models/cargo_status_update_response/cargo_status_update_response.dart';
import 'package:indian_live_cargo_mobileapp/data/secure_storage.dart/secure_storage.dart';

class UpdateCargoStatusController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> updateCargoStatuswithimage(
      File imageFile, int statusId, int cargoIds) async {
    try {
      isLoading.value = true;

      // Get the authentication token
      final authToken =
          await StorageService.instance.readSecureData('AuthToken');

      // Prepare the multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          'https://api.indianlivecargo.com/api/v1/updateCargoStatusWithAttachment',
        ),
      );

      // Add headers to the request
      request.headers['Authorization'] = 'Bearer $authToken';

      // Add form fields
      request.fields['status_id'] = statusId.toString();

      // Convert the list of cargo IDs to a JSON string
      final cargoIdsJson = jsonEncode(cargoIds);
      request.fields['cargo_id'] = cargoIds.toString();
      log("cargoid:${request.fields}");

      // Add the image file
      var imageBytes = await imageFile.readAsBytes();
      request.files.add(http.MultipartFile.fromBytes(
        'attachment',
        imageBytes,
        filename: 'attachment.jpg',
      ));

      // Send the request
      var response = await request.send();

      // Check the response status
      if (response.statusCode == 200) {
        log(response.statusCode.toString());

        // Parse the response JSON
        final jsonResponse = await http.Response.fromStream(response);
        final jsonResponseBody = jsonDecode(jsonResponse.body);
        Get.snackbar('Success', 'Update Successfully',
            backgroundColor: Color.fromARGB(102, 76, 175, 79));
        // Assuming your UpdateStatusWithImage.fromJson() is correctly implemented
        final responseData =
            CargoStatusUpdateResponse.fromJson(jsonResponseBody);

        log(responseData.message.toString());
        print('Response: ${jsonResponse.body}');

        // Your success logic here
      } else {
        // Handle the error
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Handle other errors
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateCargoStatus(
      {required String authtoken,
      required String cargoIds,
      required int statusId}) async {
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
        //hai
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
      //hlo
      print('Error updating cargo status: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
