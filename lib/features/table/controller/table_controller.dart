import 'package:get/get.dart';
import 'package:madang/features/table/model/table_model.dart';
import 'dart:async';

class TableController extends GetxController {
  RxBool loading = RxBool(false);
  RxBool error = RxBool(false);
  RxString errorMessage = RxString('');
  RxList<TableModel> tables = <TableModel>[].obs;
  RxList<TableModel> allTables = <TableModel>[].obs;
  RxList<TableModel> recommendedTables = <TableModel>[].obs;
  RxList<TableModel> allRecommendedTables = <TableModel>[].obs;
  RxList<String> tableCategories = <String>[].obs;
  RxList<TableModel> searchResults = <TableModel>[].obs;
  RxList<TableModel> favoriteTables = <TableModel>[].obs;
  RxList<TableModel> cartTables = <TableModel>[].obs;
  Timer? debounceTimer;

  void processDataToState(dynamic data, dynamic categories) {
    final List availableTables = data.toList();
    allTables.clear();
    for (int i = 0; i < availableTables.length; i++) {
      allTables.add(
        TableModel.fromMap(
          <String, dynamic>{...availableTables[i]},
        ),
      );

      tables.value = List.from(allTables);
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
    allRecommendedTables
        .clear(); // Clear existing Tables before adding new ones
    for (int i = 0; i < availableTables.length; i++) {
      allRecommendedTables.add(
        TableModel.fromMap(
          <String, dynamic>{...availableTables[i]},
        ),
      );

      recommendedTables.value = List.from(allRecommendedTables);
    }
  }

  void searchItems(String query) {
    if (query.isEmpty) {
      tables.value = List.from(allTables);
    } else {
      tables.value = allTables.where((table) {
        return table.name!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  void clearSearch() {
    tables.value = List.from(allTables); // Reset to all tables
  }
}
