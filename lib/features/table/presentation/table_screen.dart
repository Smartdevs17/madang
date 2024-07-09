import 'package:flutter/material.dart';
import 'package:madang/features/table/presentation/addon_selection.dart';
import 'package:madang/utils/action/action.dart';
import 'package:madang/utils/theme/theme.dart';

class TableScreen extends StatefulWidget {
  TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final List<Map<String, dynamic>> tables = [
    {
      'name': 'Work Table',
      'details': '1 table 1 chair',
      'image': 'assets/images/table1.png',
    },
    {
      'name': 'Family Table',
      'details': '1 table 6 chairs',
      'image': 'assets/images/table2.png',
    },
  ];

  List<String> times = [
    '30 minutes',
    '45 minutes',
    '1 hour',
    '2 hours',
  ];

  String selectedTime = '';
  bool isCustomTime = false;
  TextEditingController customTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        title: Text('Table', style: TextStyle(color: primaryColorDK)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: primaryColorDK),
        elevation: 1.0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
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
                prefixIcon: Icon(Icons.search),
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
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                Chip(
                  label: Text('Single Table'),
                  backgroundColor: Color(0xffF3F1F1),
                ),
                Chip(
                  label: Text('Double Table'),
                  backgroundColor: Color(0xffF3F1F1),
                ),
                Chip(
                  label: Text('Family Table'),
                  backgroundColor: Color(0xffF3F1F1),
                ),
                Chip(
                  label: Text('Special Table'),
                  backgroundColor: Color(0xffF3F1F1),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: tables.length,
                itemBuilder: (context, index) {
                  final table = tables[index];
                  return GestureDetector(
                    onTap: () => _showTableDetails(context, table),
                    child: Stack(
                      children: [
                        Card(
                          color: primaryColorLT,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            child: Image.asset(
                              table['image'],
                              height: 300,
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
                                  table['name'],
                                  style: const TextStyle(
                                      fontSize: 24, color: primaryColorLT),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  table['details'],
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

  void _showTableDetails(BuildContext context, Map<String, dynamic> table) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.6,
            maxChildSize: 0.9,
            minChildSize: 0.4,
            expand: false,
            builder: (context, scrollController) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 28,
                            child: const Divider(
                              color: neutralGrey,
                              height: 2,
                              thickness: 3,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Time",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10, // Space between items
                          runSpacing: 10, // Space between rows
                          alignment: WrapAlignment
                              .start, // Align items to the start of the row
                          children: times.map((time) {
                            bool isSelected = selectedTime == time;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTime = time;
                                  isCustomTime = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? mainColor
                                      : const Color(0xffF3F1F1),
                                  borderRadius: BorderRadius.circular(
                                      20), // High border radius
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      time,
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : primaryColorDK,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    if (isSelected)
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Icon(Icons.circle,
                                            size: 10, color: Colors.white),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 10),
                        if (!isCustomTime)
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isCustomTime = !isCustomTime;
                                  if (isCustomTime) {
                                    selectedTime = 'custom';
                                  }
                                });
                              },
                              child: const Text(
                                "custom time",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        if (isCustomTime)
                          RadioListTile(
                            value: "custom",
                            groupValue: selectedTime,
                            onChanged: (value) {
                              setState(() {
                                selectedTime = value.toString();
                                isCustomTime = false;
                              });
                            },
                            activeColor: mainColor,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: customTimeController,
                                  decoration: InputDecoration(
                                    hintText: '10 minutes',
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
                                const Text(
                                  "example: 10 minutes, 1 hour",
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 10),
                        const AddonSelection(),
                        const SizedBox(height: 10),
                        const Column(
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Book table logic
                            showSnackbar(
                              message: 'Successfully booking table',
                              error: false,
                            );
                            // SnackBar(content: Text("Successfully place order"));
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Text(
                            'Book Table',
                            style:
                                TextStyle(fontSize: 18, color: primaryColorLT),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
      },
    );
  }
}
