import 'dart:convert';

OrderModel orderModelFromMap(String str) =>
    OrderModel.fromMap(json.decode(str));

String orderModelToMap(OrderModel data) => json.encode(data.toMap());

class OrderModel {
  int? id;
  int? userId;
  int? restaurantId;
  int? tableId;
  List<FoodOrder>? foodOrders;
  List<dynamic>? addonOrders;
  double? totalPrice;
  String? status;
  String? specialNotes;
  DateTime? createdAt;
  DateTime? updatedAt;

  OrderModel({
    this.id,
    this.userId,
    this.restaurantId,
    this.tableId,
    this.foodOrders,
    this.addonOrders,
    this.totalPrice,
    this.status,
    this.specialNotes,
    this.createdAt,
    this.updatedAt,
  });

  OrderModel copyWith({
    int? id,
    int? userId,
    int? restaurantId,
    int? tableId,
    List<FoodOrder>? foodOrders,
    List<dynamic>? addonOrders,
    double? totalPrice,
    String? status,
    String? specialNotes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      OrderModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        restaurantId: restaurantId ?? this.restaurantId,
        tableId: tableId ?? this.tableId,
        foodOrders: foodOrders ?? this.foodOrders,
        addonOrders: addonOrders ?? this.addonOrders,
        totalPrice: totalPrice ?? this.totalPrice,
        status: status ?? this.status,
        specialNotes: specialNotes ?? this.specialNotes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        userId: json["user_id"],
        restaurantId: json["restaurant_id"],
        tableId: json["table_id"],
        foodOrders: json["food_orders"] == null
            ? []
            : List<FoodOrder>.from(
                json["food_orders"]!.map((x) => FoodOrder.fromMap(x))),
        addonOrders: json["addon_orders"] == null
            ? []
            : List<dynamic>.from(json["addon_orders"]!.map((x) => x)),
        totalPrice: json["total_price"]?.toDouble(),
        status: json["status"],
        specialNotes: json["special_notes"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "restaurant_id": restaurantId,
        "table_id": tableId,
        "food_orders": foodOrders == null
            ? []
            : List<dynamic>.from(foodOrders!.map((x) => x.toMap())),
        "addon_orders": addonOrders == null
            ? []
            : List<dynamic>.from(addonOrders!.map((x) => x)),
        "total_price": totalPrice,
        "status": status,
        "special_notes": specialNotes,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class FoodOrder {
  int? id;
  int? orderId;
  int? foodId;
  Food? food;
  int? quantity;

  FoodOrder({
    this.id,
    this.orderId,
    this.foodId,
    this.food,
    this.quantity,
  });

  FoodOrder copyWith({
    int? id,
    int? orderId,
    int? foodId,
    Food? food,
    int? quantity,
  }) =>
      FoodOrder(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        foodId: foodId ?? this.foodId,
        food: food ?? this.food,
        quantity: quantity ?? this.quantity,
      );

  factory FoodOrder.fromMap(Map<String, dynamic> json) => FoodOrder(
        id: json["id"],
        orderId: json["order_id"],
        foodId: json["food_id"],
        food: json["food"] == null ? null : Food.fromMap(json["food"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_id": orderId,
        "food_id": foodId,
        "food": food?.toMap(),
        "quantity": quantity,
      };
}

class Food {
  int? id;
  String? name;
  String? description;
  String? image;
  int? price;
  int? restaurantId;
  int? categoryId;
  dynamic ratings;
  int? averageRating;
  DateTime? createdAt;
  DateTime? updatedAt;

  Food({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.restaurantId,
    this.categoryId,
    this.ratings,
    this.averageRating,
    this.createdAt,
    this.updatedAt,
  });

  Food copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    int? price,
    int? restaurantId,
    int? categoryId,
    dynamic ratings,
    int? averageRating,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Food(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        price: price ?? this.price,
        restaurantId: restaurantId ?? this.restaurantId,
        categoryId: categoryId ?? this.categoryId,
        ratings: ratings ?? this.ratings,
        averageRating: averageRating ?? this.averageRating,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Food.fromMap(Map<String, dynamic> json) => Food(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        restaurantId: json["restaurant_id"],
        categoryId: json["category_id"],
        ratings: json["ratings"],
        averageRating: json["average_rating"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "price": price,
        "restaurant_id": restaurantId,
        "category_id": categoryId,
        "ratings": ratings,
        "average_rating": averageRating,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
