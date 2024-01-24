import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indian_live_cargo_mobileapp/data/models/update_status_with_image/update_status_with_image.dart';
import 'package:indian_live_cargo_mobileapp/data/secure_storage.dart/secure_storage.dart';

class UpdateStatusWithImageController extends GetxController {
  var isLoading = false.obs;
  UpdateStatusWithImage responseData = UpdateStatusWithImage();

  Future<void> updateCargoStatusWithAttachment(
      File imageFile, int statusId, String cargoIds) async {
    try {
      isLoading.value = true;

      // Get the authentication token
      final authToken =
          await StorageService.instance.readSecureData('AuthToken');

      // Prepare the multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          'https://api.indianlivecargo.com/api/v1/updateCargoStatus',
        ),
      );

      // Add headers to the request
      request.headers['Authorization'] = 'Bearer $authToken';

      // Add form fields
      request.fields['status_id'] = statusId.toString();

      // Convert the list of cargo IDs to a JSON string
      final cargoIdsJson = jsonEncode(cargoIds);
      request.fields['cargo_id'] = cargoIds;
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
        responseData = UpdateStatusWithImage.fromJson(jsonResponseBody);

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
}
