// auth_controller.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:indian_live_cargo_mobileapp/data/models/login_model/login_model.dart';

class AuthController extends GetxController {
  final String baseUrl = 'https://api.indianlivecargo.com/api/v1';
  RxBool isLoading = false.obs;

  Rx<UserModel?> user = Rx<UserModel?>(null);

  Future<void> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final Map<String, String> body = {
      'username': username,
      'password': password,
    };
    try {
      isLoading.value = true;
      final response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        user.value = UserModel.fromJson(jsonResponse['data']);
        print(user.value!.apiToken.toString());
        Get.snackbar('Success', 'Login Successfully',
            backgroundColor: Color.fromARGB(102, 76, 175, 79));
      } else {
        // Handle authentication error
        Get.snackbar('Error', 'Invalid username or password');
      }
    } catch (error) {
      // Handle other errors (network issues, server errors, etc.)
      Get.snackbar('Error', 'An error occurred while processing your request');
    } finally {
      isLoading.value = false;
    }
  }
}
