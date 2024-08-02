import 'dart:convert';

FoodModel foodModelFromMap(String str) => FoodModel.fromMap(json.decode(str));

String foodModelToMap(FoodModel data) => json.encode(data.toMap());

class FoodModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? restaurantId;
  int? categoryId;
  dynamic ratings;
  int? averageRating;

  FoodModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.restaurantId,
    this.categoryId,
    this.ratings,
    this.averageRating,
  });

  FoodModel copyWith({
    int? id,
    String? name,
    String? description,
    int? price,
    int? restaurantId,
    int? categoryId,
    dynamic ratings,
    int? averageRating,
  }) =>
      FoodModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        restaurantId: restaurantId ?? this.restaurantId,
        categoryId: categoryId ?? this.categoryId,
        ratings: ratings ?? this.ratings,
        averageRating: averageRating ?? this.averageRating,
      );

  factory FoodModel.fromMap(Map<String, dynamic> json) => FoodModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        restaurantId: json["restaurant_id"],
        categoryId: json["category_id"],
        ratings: json["ratings"],
        averageRating: json["average_rating"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "restaurant_id": restaurantId,
        "category_id": categoryId,
        "ratings": ratings,
        "average_rating": averageRating,
      };
}
