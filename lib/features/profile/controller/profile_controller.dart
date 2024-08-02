import 'package:get/get.dart';
import 'package:madang/features/profile/models/user_model.dart';

class ProfileController extends GetxController {
  //Modelized Profile Data
  UserModel userProfile = UserModel();

  void processDataToState(dynamic userData) {
    final UserModel modelizedUser = UserModel.fromMap(<dynamic, dynamic>{
      ...userData,
    });
    userProfile = modelizedUser;
    update();
  }
}
