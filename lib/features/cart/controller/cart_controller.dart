import 'package:get/get.dart';
import 'package:madang/common/model/api_response_model.dart';
import 'package:madang/features/cart/model/cart_model.dart';
import 'package:madang/features/cart/repository/cart_repository.dart';
import 'package:madang/features/food/model/food_model.dart';
import 'package:madang/features/recent/controller/order_controller.dart';
import 'package:madang/features/recent/model/order_model.dart';
import 'package:madang/features/table/model/table_model.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/action/action.dart';

class CartController extends GetxController {
  final OrderController _orderController = Get.find<OrderController>();
  RxBool loading = RxBool(false);
  RxBool error = RxBool(false);
  var cartItems = <CartItem>[].obs;

  void addFoodToCart(FoodModel food, int quantity) {
    var existingItemIndex =
        cartItems.indexWhere((item) => item.food?.id == food.id);
    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].quantity += quantity;
    } else {
      cartItems.add(CartItem(food: food, quantity: quantity));
    }
    update();
  }

  void addTableToCart(TableModel table) {
    var existingItemIndex =
        cartItems.indexWhere((item) => item.table?.id == table.id);
    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].quantity++;
    } else {
      cartItems.add(CartItem(table: table));
    }
    update();
  }

  void addAdditionalToCart(CartItem item, List additionalItems) {
    var existingItemIndex = cartItems.indexOf(item);
    if (existingItemIndex != -1) {
      cartItems[existingItemIndex].additional = additionalItems;
      update();
    }
  }

  void removeItemFromCart(CartItem item) {
    var message = item.food == "food" ? "food deleted" : "table deleted";
    showSnackbar(
      message: message,
      error: false,
    );
    cartItems.remove(item);
    update();
  }

  void updateQuantity(CartItem item, int quantity) {
    if (quantity > 0) {
      item.quantity = quantity;
    } else {
      cartItems.remove(item);
    }
    cartItems.refresh();
  }

  double get totalFoodPrice {
    return cartItems
        .where((item) => item.food != null) // Filter for food items
        .fold(0, (sum, item) => sum + item.totalPrice.toDouble());
  }

  double get totalTablePrice {
    return cartItems
        .where((item) => item.table != null) // Filter for table items
        .fold(0, (sum, item) => sum + item.totalPrice.toDouble());
  }

  double get totalAdditionalPrice {
    return cartItems
        .where((item) =>
            item.additional != null &&
            item.additional!
                .isNotEmpty) // Filter for items with additional prices
        .fold(
            0.0,
            (sum, item) =>
                sum +
                (item.additional?.fold(
                            0.0,
                            (additionalSum, addon) =>
                                additionalSum + (addon.price ?? 0)) ??
                        0) *
                    (item.quantity ?? 1));
  }

  double get totalPrice {
    return totalFoodPrice + totalTablePrice + totalAdditionalPrice;
  }

  List _additional = [];

  // Getter for additional
  List get additional => _additional;

  // Setter for additional
  set additional(List value) {
    _additional = value;
  }

  void clearCart() {
    cartItems.clear();
  }

  // Create Order Controller (Create a new Order to Remote Data Source)
  Future<void> placeOrder(Map<String, dynamic> body) async {
    loading(true);
    error(false);
    update();
    try {
      final ApiResponseModel response = await CartRepository.placeOrder(body);
      if (response.success) {
        showSnackbar(
            title: 'Success!', message: response.message, error: false);
        _orderController.orders.add(OrderModel.fromMap(response.data));
        clearCart();
        Get.toNamed(Routes.paymentMethod);
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

  @override
  void onInit() {
    super.onInit();
    // Load cart items if needed
  }
}
