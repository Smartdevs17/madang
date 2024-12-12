import 'package:get/get.dart';
import 'package:madang/features/food/model/food_model.dart';
import 'package:madang/features/recent/model/order_model.dart';

class OrderController extends GetxController {
  RxBool loading = RxBool(false);
  RxBool error = RxBool(false);
  RxString errorMessage = RxString('');
  RxList<OrderModel> orders = <OrderModel>[].obs;
  RxList<FoodModel> searchResults = <FoodModel>[].obs;
  RxList<FoodModel> favoriteFoods = <FoodModel>[].obs;
  RxList<FoodModel> cartFoods = <FoodModel>[].obs;

  void processDataToState(dynamic data) {
    final List userOrders = data.toList();
    orders.clear(); // Clear existing foods before adding new ones
    for (int i = 0; i < userOrders.length; i++) {
      orders.add(
        OrderModel.fromMap(
          <String, dynamic>{...userOrders[i]},
        ),
      );
    }
  }
}
