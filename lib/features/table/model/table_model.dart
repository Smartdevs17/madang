import 'dart:convert';

TableModel tableModelFromMap(String str) =>
    TableModel.fromMap(json.decode(str));

String tableModelToMap(TableModel data) => json.encode(data.toMap());

class TableModel {
  int? id;
  String? name;
  int? number;
  int? capacity;
  String? image;
  int? price;
  int? restaurantId;
  int? categoryId;
  dynamic addons;

  TableModel({
    this.id,
    this.name,
    this.number,
    this.capacity,
    this.image,
    this.price,
    this.restaurantId,
    this.categoryId,
    this.addons,
  });

  TableModel copyWith({
    int? id,
    String? name,
    int? number,
    int? capacity,
    String? image,
    int? price,
    int? restaurantId,
    int? categoryId,
    dynamic addons,
  }) =>
      TableModel(
        id: id ?? this.id,
        name: name ?? this.name,
        number: number ?? this.number,
        capacity: capacity ?? this.capacity,
        image: image ?? this.image,
        price: price ?? this.price,
        restaurantId: restaurantId ?? this.restaurantId,
        categoryId: categoryId ?? this.categoryId,
        addons: addons ?? this.addons,
      );

  factory TableModel.fromMap(Map<String, dynamic> json) => TableModel(
        id: json["id"],
        name: json["name"],
        number: json["number"],
        capacity: json["capacity"],
        image: json["image"],
        price: json["price"],
        restaurantId: json["restaurant_id"],
        categoryId: json["category_id"],
        addons: json["addons"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "number": number,
        "capacity": capacity,
        "image": image,
        "price": price,
        "restaurant_id": restaurantId,
        "category_id": categoryId,
        "addons": addons,
      };
}
