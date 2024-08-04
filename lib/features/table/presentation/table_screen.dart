import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madang/features/table/controller/table_controller.dart';
import 'package:madang/features/table/model/table_model.dart';
import 'package:madang/features/table/presentation/addon_selection.dart';
import 'package:madang/features/table/presentation/table_details.dart';
import 'package:madang/utils/action/action.dart';
import 'package:madang/utils/theme/theme.dart';

class TableScreen extends StatefulWidget {
  TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final TableController tableController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        title: const Text('Table', style: TextStyle(color: primaryColorDK)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: primaryColorDK),
        elevation: 1.0,
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search table',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: neutralGrey,
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(() {
                if (!tableController.loading.value) {
                  // If loading is complete, build the Wrap widget
                  if (tableController.tableCategories.isNotEmpty) {
                    return Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: tableController.tableCategories.map((category) {
                        return Chip(
                          label: Text(category),
                          backgroundColor: const Color(0xffF3F1F1),
                        );
                      }).toList(),
                    );
                  } else {
                    return Container();
                  }
                } else {
                  // While loading, you might want to show a loading indicator
                  return Container();
                }
              }),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: tableController.tables.length,
                itemBuilder: (context, index) {
                  final table = tableController.tables[index];
                  return GestureDetector(
                    onTap: () => showTableDetails(context, table),
                    child: Stack(
                      children: [
                        Card(
                          color: primaryColorLT,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: Image.network(
                              table.image!,
                              height: 400,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  table.name!,
                                  style: const TextStyle(
                                      fontSize: 24, color: primaryColorLT),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "${table.name} table ${table.capacity} chairs",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: primaryColorLT,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
