import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:madang/common/model/api_response_model.dart';
import 'package:madang/features/auth/controller/token_controller.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/action/action.dart';
import 'package:madang/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final TokenController _tokenController = Get.find<TokenController>();

  // Login Route
  Future<dynamic> login(String email, String password) async {
    Map<String, dynamic> data = <String, dynamic>{
      'email': email,
      'password': password,
    };
    final http.Response response = await http.post(
      Uri.parse('${Constants.baseUrl}/auth/login'),
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    final dynamic jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      await _tokenController.setToken(jsonResponse["data"]["token"]);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          Constants.userId, jsonResponse["data"]["id"].toString());
      return jsonResponse;
    } else {
      return jsonResponse;
    }
  }

  // Register Route
  Future<dynamic> register(String name, String email, String password) async {
    Map<String, dynamic> data = <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'role': 'user'
    };
    final http.Response response = await http.post(
      Uri.parse('${Constants.baseUrl}/auth/register'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    final dynamic jsonResponse = json.decode(response.body);
    return jsonResponse;
  }

  Future<dynamic> verifyEmail(String email, String otp) async {
    Map<String, dynamic> data = <String, dynamic>{
      'email': email,
      'otp': otp,
    };
    final http.Response response = await http.post(
      Uri.parse('${Constants.baseUrl}/auth/verify-email'),
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    final dynamic jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      await _tokenController.setToken(jsonResponse["data"]["token"]);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          Constants.userId, jsonResponse["data"]["id"].toString());
      return jsonResponse;
    } else {
      return jsonResponse;
    }
  }

  // HTTP POST CALL
  static Future<ApiResponseModel> post({
    required String path,
    required Map<String, dynamic> body,
    dynamic data,
  }) async {
    final String token = Get.find<TokenController>().token.value;
    log(token);
    try {
      final http.Response response = await http.post(
        Uri.parse('${Constants.baseUrl}/$path'),
        body: jsonEncode(body),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      log(response.body);
      return ApiResponseModel.fromMap(jsonDecode(response.body));
    } catch (e) {
      showSnackbar(
        title: 'OOPS!',
        message: 'An error occurred, please try again!',
        error: true,
      );
      return ApiResponseModel(
        success: false,
        message: e.toString(),
        data: <dynamic, dynamic>{},
      );
    }
  }

  // Logout
  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await Get.find<TokenController>().clearToken();
    await prefs.remove(Constants.userId);
    Get.offAllNamed(Routes.auth);
  }

  // HTTP GET
  static Future<ApiResponseModel> get({required String path}) async {
    final String? token = Get.find<TokenController>().token.value;

    if (token != null && token.isNotEmpty) {
      try {
        final http.Response response = await http.get(
          Uri.parse('${Constants.baseUrl}/$path'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': "Bearer $token",
          },
        );
        log(response.body.toString());
        return ApiResponseModel.fromMap(jsonDecode(response.body));
      } catch (e) {
        return ApiResponseModel(
          success: false,
          message: e.toString(),
          data: <dynamic, dynamic>{},
        );
      }
    }
    return ApiResponseModel(
      success: false,
      message: 'No token found',
      data: <dynamic, dynamic>{},
    );
  }

  // HTTP PUT
  static Future<ApiResponseModel> put({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    final String token = Get.find<TokenController>().token.value;
    log(token);
    try {
      final http.Response response = await http.put(
        Uri.parse('${Constants.baseUrl}/$path'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );
      log(response.body.toString());
      return ApiResponseModel.fromMap(jsonDecode(response.body));
    } catch (e) {
      return ApiResponseModel(
        success: false,
        message: e.toString(),
        data: <String, String>{},
      );
    }
  }

  // HTTP DELETE
  static Future<ApiResponseModel> delete({
    required String path,
    required num id,
  }) async {
    final String token = Get.find<TokenController>().token.value;
    log(token);
    try {
      final http.Response response = await http.delete(
        Uri.parse('${Constants.baseUrl}/$path/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      log(response.body.toString());
      return ApiResponseModel.fromMap(jsonDecode(response.body));
    } catch (e) {
      return ApiResponseModel(
        success: false,
        message: e.toString(),
        data: <String, String>{},
      );
    }
  }
}
