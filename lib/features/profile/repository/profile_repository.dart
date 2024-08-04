import 'package:madang/common/model/api_response_model.dart';
import 'package:madang/services/api_service.dart';

class ProfileRepository {
  static Future<ApiResponseModel> updateUser(
      int id, Map<String, dynamic> body) async {
    final ApiResponseModel response =
        await ApiService.put(path: "users/$id", body: body);
    return response;
  }
}
