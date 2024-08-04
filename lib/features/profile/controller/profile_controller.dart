import 'package:get/get.dart';
import 'package:madang/common/model/api_response_model.dart';
import 'package:madang/features/profile/models/user_model.dart';
import 'package:madang/features/profile/repository/profile_repository.dart';
import 'package:madang/utils/action/action.dart';

class ProfileController extends GetxController {
  RxBool loading = RxBool(false);
  RxBool error = RxBool(false);
  //Modelized Profile Data
  UserModel userProfile = UserModel();

  void processDataToState(dynamic userData) {
    final UserModel modelizedUser = UserModel.fromMap(<dynamic, dynamic>{
      ...userData,
    });
    userProfile = modelizedUser;
    update();
  }

  // Update Document in Remote Source and State
  Future<void> updateUser(int id, Map<String, dynamic> data) async {
    loading(true);
    error(false);
    update();
    try {
      final ApiResponseModel response =
          await ProfileRepository.updateUser(id, data);
      if (response.success) {
        processDataToState(response.data);
        showSnackbar(
            title: 'Success!', message: response.message, error: false);
      } else {
        showSnackbar(title: 'OOPS!', message: response.message, error: true);
        error(true);
      }
    } catch (e) {
      showSnackbar(title: 'OOPS!', message: e.toString(), error: true);
      error(true);
    } finally {
      loading(false);
      update();
    }
  }
}
