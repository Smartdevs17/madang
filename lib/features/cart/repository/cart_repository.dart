import 'package:madang/common/model/api_response_model.dart';
import 'package:madang/services/api_service.dart';

class CartRepository {
  static Future<ApiResponseModel> placeOrder(Map<String, dynamic> body) async {
    final ApiResponseModel response = await ApiService.post(
      path: "orders/",
      body: body,
    );
    return response;
  }
}
