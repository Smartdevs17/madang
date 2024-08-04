import 'package:get/get.dart';
import 'package:madang/features/table/model/table_model.dart';

class TableController extends GetxController {
  RxBool loading = RxBool(false);
  RxBool error = RxBool(false);
  RxString errorMessage = RxString('');
  RxList<TableModel> tables = <TableModel>[].obs;
  RxList<TableModel> recommendedTables = <TableModel>[].obs;
  RxList<String> tableCategories = <String>[].obs;
  RxList<TableModel> searchResults = <TableModel>[].obs;
  RxList<TableModel> favoriteTables = <TableModel>[].obs;
  RxList<TableModel> cartTables = <TableModel>[].obs;

  void processDataToState(dynamic data, dynamic categories) {
    final List availableTables = data.toList();
    tables.clear(); // Clear existing Tables before adding new ones
    for (int i = 0; i < availableTables.length; i++) {
      tables.add(
        TableModel.fromMap(
          <String, dynamic>{...availableTables[i]},
        ),
      );
    }
    final List availableCategories = categories.toList();
    tableCategories.clear();
    for (int i = 0; i < availableCategories.length; i++) {
      if (availableCategories[i]['type'] == 'table') {
        tableCategories.add(availableCategories[i]['name']);
      }
    }
  }

  void processRecommendedTablesToState(dynamic data) {
    final List availableTables = data.toList();
    recommendedTables.clear(); // Clear existing Tables before adding new ones
    for (int i = 0; i < availableTables.length; i++) {
      recommendedTables.add(
        TableModel.fromMap(
          <String, dynamic>{...availableTables[i]},
        ),
      );
    }
  }
}
