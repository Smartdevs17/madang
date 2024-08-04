import 'package:get/get.dart';
import 'package:madang/features/food/model/food_model.dart';

class FoodController extends GetxController {
  RxBool loading = RxBool(false);
  RxBool error = RxBool(false);
  RxString errorMessage = RxString('');
  RxList<FoodModel> foods = <FoodModel>[].obs;
  RxList<FoodModel> recommendedFoods = <FoodModel>[].obs;
  RxList<String> foodCategories = <String>[].obs;
  RxList<FoodModel> searchResults = <FoodModel>[].obs;
  RxList<FoodModel> favoriteFoods = <FoodModel>[].obs;
  RxList<FoodModel> cartFoods = <FoodModel>[].obs;

  void processDataToState(dynamic data, dynamic categories) {
    final List availableFoods = data.toList();
    foods.clear(); // Clear existing foods before adding new ones
    for (int i = 0; i < availableFoods.length; i++) {
      foods.add(
        FoodModel.fromMap(
          <String, dynamic>{...availableFoods[i]},
        ),
      );
    }
    final List availableCategories = categories.toList();
    foodCategories.clear();
    for (int i = 0; i < availableCategories.length; i++) {
      if (availableCategories[i]['type'] == 'food') {
        foodCategories.add(availableCategories[i]['name']);
      }
    }
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
}
