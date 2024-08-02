import 'dart:math';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:madang/features/profile/controller/profile_controller.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/services/api_service.dart';
import 'package:madang/utils/action/action.dart';
import 'package:madang/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  //Auth Loading State
  RxBool isLoading = RxBool(false);
  final ProfileController _profileController = Get.put(ProfileController());

  //ApiService
  final ApiService _apiService = ApiService();

//Check for valid Email
  static bool isValidEmail(String email) {
    if (email.isEmpty) return false;
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool emailValidatorExists(String? val, {required bool isUnique}) {
    if (!isValidEmail(val!)) {
      return false;
    } else {
      return true;
    }
  }

  //Save to sharedPerference
  Future<void> saveToSharedPreferences(String value, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  //Validate Login Endpoint
  String? loginValidator(String email, String password) {
    if (email.isEmpty) {
      return 'Email cannot be empty!';
    } else if (!email.isEmail) {
      return 'Invalid email format!';
    } else if (password.isEmpty) {
      return 'Password cannot be empty!';
    } else if (password.length < 5) {
      return 'Password too short';
    } else {
      return null;
    }
  }

  String? otpValidator(String email, String otp) {
    if (email.isEmpty) {
      return 'Email cannot be empty!';
    } else if (!email.isEmail) {
      return 'Invalid email format!';
    } else if (otp.isEmpty) {
      return 'Code cannot be empty!';
    } else if (otp.length < 4) {
      return 'Code too short';
    } else {
      return null;
    }
  }

  Future<dynamic> login(String email, String password) async {
    if (loginValidator(email, password) != null) {
      //display error
    } else {
      var user = await _apiService.login(email, password);
      if (user['success'] == false) {
        showSnackbar(
            title: user['message'], message: user['error'], error: true);
      } else {
        _profileController.processDataToState(user['data']);
        showSnackbar(
          title: "Login successful!",
          message: user['message'],
          error: false,
        );
        Get.toNamed(Routes.index);
      }
    }
  }

  Future<void> register(String name, String email, String password) async {
    if ((!isValidEmail(email))) {
      ///display error
    } else {
      var newUser = await _apiService.register(name, email, password);
      if (newUser['success'] == false) {
        showSnackbar(
            title: newUser['message'], message: newUser['error'], error: true);
      } else {
        await GetStorage().write(Constants.User_Email, email);

        showSnackbar(
          title: "Registration successful!",
          message: "Proceed to verify email",
          error: false,
        );
        Get.offAndToNamed(Routes.otp);
      }
    }
  }

  Future<dynamic> validateEmail(String email, String otp) async {
    if (otpValidator(email, otp) != null) {
      //display error
    } else {
      var user = await _apiService.verifyEmail(email, otp);
      if (user['success'] == false) {
        showSnackbar(
            title: user['message'], message: user['error'], error: true);
      } else {
        _profileController.processDataToState(user['data']);
        showSnackbar(
          title: "Email verified successfully!",
          message: user['message'],
          error: false,
        );
        Get.toNamed(Routes.index);
      }
    }
  }
}
