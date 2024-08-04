import 'package:madang/common/model/api_response_model.dart';
import 'package:madang/services/api_service.dart';

class HomeRepository {
  ///Get Init Data
  static Future<ApiResponseModel> fetchData() async {
    final ApiResponseModel response = await ApiService.get(path: 'inits');
    return response;
  }
}
