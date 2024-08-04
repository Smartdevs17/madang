import 'package:madang/common/model/api_response_model.dart';
import 'package:madang/services/api_service.dart';

class FoodRepository {
  ///Fetch all Foods
  static Future<ApiResponseModel> fetchFoods() async {
    final ApiResponseModel response = await ApiService.get(path: "foods");
    return response;
  }

  //Get User Foods
  static Future<ApiResponseModel> fetchUserFoods({required String id}) async {
    final ApiResponseModel response = await ApiService.get(
      path: "foods/user/$id",
    );
    return response;
  }

  static Future<ApiResponseModel> searchUserFoods(
      {required String query}) async {
    final ApiResponseModel response = await ApiService.get(
      path: "foods/search?search=$query",
    );
    return response;
  }
}
