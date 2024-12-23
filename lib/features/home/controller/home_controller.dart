import 'package:get/get.dart';
import 'package:madang/common/model/api_response_model.dart';
import 'package:madang/features/food/controller/food_controller.dart';
import 'package:madang/features/home/repository/home_repository.dart';
import 'package:madang/features/profile/controller/profile_controller.dart';
import 'package:madang/features/recent/controller/order_controller.dart';
import 'package:madang/features/table/controller/table_controller.dart';

class HomeController extends GetxController {
  final ProfileController profileController = Get.find<ProfileController>();
  final FoodController foodController = Get.find<FoodController>();
  final TableController tableController = Get.find<TableController>();
  final OrderController orderController = Get.find<OrderController>();
  var loading = false.obs;
  var error = false.obs;
  var errorMessage = ''.obs;

  Future<void> loadData() async {
    loading(true);
    error(false);
    errorMessage('');
    try {
      final ApiResponseModel response = await HomeRepository.fetchData();
      if (response.success) {
        profileController.processDataToState(response.data['user']);
        foodController.processDataToState(
          response.data['foods'],
          response.data['categories'],
        );
        foodController.processRecommendedFoodsToState(
          response.data['recommended_foods'],
        );
        tableController.processDataToState(
          response.data['tables'],
          response.data['categories'],
        );
        tableController.processRecommendedTablesToState(
          response.data['recommended_tables'],
        );
        orderController.processDataToState(response.data['orders']);
      } else {
        errorMessage(response.message); // Handle error message from API
        error(true);
      }
    } catch (e) {
      if (e.toString().contains('No Internet Connection')) {
        errorMessage('No Internet Connection');
      } else if (e.toString().contains('Bad Access Token')) {
        errorMessage('Bad Access Token');
      } else {
        errorMessage('Failed to load data');
      }
      error(true);
    } finally {
      loading(false);
    }
  }

  void searchItems(String query) {
    if (query.isEmpty) {
      foodController.foods.value = List.from(foodController.allFoods);
      tableController.tables.value = List.from(tableController.allTables);
    } else {
      foodController.foods.value = foodController.allFoods.where((food) {
        return food.name!.toLowerCase().contains(query.toLowerCase());
      }).toList();

      tableController.tables.value = tableController.allTables.where((table) {
        return table.name!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }
}
