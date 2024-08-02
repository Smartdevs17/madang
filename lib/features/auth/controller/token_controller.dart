import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:madang/utils/constants/constants.dart';

class TokenController extends GetxController {
  final GetStorage _storage = GetStorage();
  var isAuthenticated = false.obs;
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeToken();
  }

  Future<void> _initializeToken() async {
    token.value = _storage.read(Constants.accessToken) ?? '';
    isAuthenticated.value = token.isNotEmpty;
  }

  Future<void> setToken(String newToken) async {
    await _storage.write(Constants.accessToken, newToken);
    token.value = newToken;
    isAuthenticated.value = true;
  }

  Future<void> clearToken() async {
    await _storage.remove(Constants.accessToken);
    token.value = '';
    isAuthenticated.value = false;
  }
}
