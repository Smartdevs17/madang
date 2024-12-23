import 'package:get/get.dart';
import 'package:madang/features/food/model/food_model.dart';

class FoodController extends GetxController {
  RxBool loading = RxBool(false);
  RxBool error = RxBool(false);
  RxString errorMessage = RxString('');
  RxList<FoodModel> foods = <FoodModel>[].obs;
  RxList<FoodModel> allFoods =
      <FoodModel>[].obs; // Keep all foods here for reference
  RxList<FoodModel> recommendedFoods = <FoodModel>[].obs;
  RxList<String> foodCategories = <String>[].obs;
  RxList<FoodModel> searchResults = <FoodModel>[].obs;
  RxList<FoodModel> favoriteFoods = <FoodModel>[].obs;
  RxList<FoodModel> cartFoods = <FoodModel>[].obs;

  void processDataToState(dynamic data, dynamic categories) {
    final List availableFoods = data.toList();
    allFoods.clear(); // Clear allFoods before adding new ones
    for (int i = 0; i < availableFoods.length; i++) {
      allFoods.add(FoodModel.fromMap(<String, dynamic>{...availableFoods[i]}));
    }

    // Populate the food categories
    final List availableCategories = categories.toList();
    foodCategories.clear();
    for (int i = 0; i < availableCategories.length; i++) {
      if (availableCategories[i]['type'] == 'food') {
        foodCategories.add(availableCategories[i]['name']);
      }
    }

    // Initially set foods to allFoods (default behavior)
    foods.value = List.from(allFoods);
  }

  void processRecommendedFoodsToState(dynamic data) {
    final List availableFoods = data.toList();
    recommendedFoods.clear(); // Clear existing foods before adding new ones
    for (int i = 0; i < availableFoods.length; i++) {
      recommendedFoods.add(
        FoodModel.fromMap(
          <String, dynamic>{...availableFoods[i]},
        ),
      );
    }
  }

  void searchItems(String query) {
    if (query.isEmpty) {
      foods.value =
          List.from(allFoods); // Reset foods to allFoods if query is empty
    } else {
      foods.value = allFoods
          .where(
              (food) => food.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void clearSearch() {
    foods.value = List.from(allFoods); // Reset to all foods
  }
}
