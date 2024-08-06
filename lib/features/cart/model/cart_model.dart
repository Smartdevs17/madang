// import 'package:madang/features/food/model/food_model.dart';
// import 'package:madang/features/table/model/table_model.dart';

// class CartItem {
//   FoodModel? food;
//   TableModel? table;
//   int quantity;
//   List<Addon>? additional; // Assuming Addon is a model for additional items

//   CartItem({this.food, this.table, this.quantity = 1, this.additional});

//   num get totalPrice {
//     num basePrice = 0;
//     if (food != null) {
//       basePrice = food!.price!;
//     } else if (table != null) {
//       basePrice = table!.price!;
//     }

//     // Sum the price of additional items
//     num additionalPrice = additional?.fold(0, (sum, addon) => sum + addon.price!) ?? 0;

//     return (basePrice + additionalPrice) * quantity;
//   }
// }

import 'package:madang/features/food/model/food_model.dart';
import 'package:madang/features/table/model/table_model.dart';

class CartItem {
  FoodModel? food;
  TableModel? table;
  int quantity;
  List? additional; // Assuming Addon is a model for additional items

  CartItem({this.food, this.table, this.quantity = 1, this.additional});

  num get totalPrice {
    num basePrice = 0;
    if (food != null) {
      basePrice = food!.price!;
    } else if (table != null) {
      basePrice = table!.price!;
    }

    // Sum the price of additional items
    num additionalPrice =
        additional?.fold(0, (sum, addon) => sum! + addon.price!) ?? 0;

    return (basePrice + additionalPrice) * quantity;
  }
}
