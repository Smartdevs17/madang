// cart_item.dart
class CartItem {
  final String id;
  final String title;
  late final int quantity;
  final double price;
  final List additional; // Define it if it's missing

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.additional,
  });
}
