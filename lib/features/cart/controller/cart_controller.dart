// cart_controller.dart
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:madang/features/cart/presentation/cart_item.dart';

class CartController extends GetxController {
  var items = <String, CartItem>{}.obs;
  final box = GetStorage();

  double get totalAmount {
    return items.values
        .fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  void addItem(String productId, String title, double price) {
    if (items.containsKey(productId)) {
      items.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
        ),
      );
    } else {
      items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }
    saveCart();
  }

  void removeItem(String productId) {
    items.remove(productId);
    saveCart();
  }

  void undoRemoveItem(String productId, CartItem item) {
    items[productId] = item;
    saveCart();
  }

  void saveCart() {
    box.write('cart', items);
  }

  void loadCart() {
    final savedCart = box.read('cart') as Map<String, dynamic>?;
    if (savedCart != null) {
      items.assignAll(savedCart.map((key, value) {
        return MapEntry(
          key,
          CartItem(
            id: value['id'],
            title: value['title'],
            quantity: value['quantity'],
            price: value['price'],
          ),
        );
      }));
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }
}
