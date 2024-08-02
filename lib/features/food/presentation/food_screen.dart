import 'package:flutter/material.dart';
import 'package:madang/utils/action/action.dart';
import 'package:madang/utils/theme/theme.dart';

class FoodScreen extends StatefulWidget {
  FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final List<Map<String, dynamic>> foods = [
    {
      'name': 'Meatball Sweatie',
      'price': '#6350',
      'rating': 4.9,
      'image': 'assets/images/Intersect.png',
    },
    {
      'name': 'Noodle Ex',
      'price': '#4200',
      'rating': 4.8,
      'image': 'assets/images/Intersect1.png',
    },
    {
      'name': 'Burger Ala Ala',
      'price': '#4000',
      'rating': 4.7,
      'image': 'assets/images/Intersect2.png',
    },
    {
      'name': 'Chicken',
      'price': '#7800',
      'rating': 4.5,
      'image': 'assets/images/Intersect3.png',
    },
    {
      'name': 'Noodle Ex',
      'price': '#4200',
      'rating': 4.8,
      'image': 'assets/images/Intersect1.png',
    },
    {
      'name': 'Meatball Sweatie',
      'price': '#6350',
      'rating': 4.9,
      'image': 'assets/images/Intersect.png',
    },
  ];

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        title: const Text(
          'Food',
          style: TextStyle(
            color: primaryColorDK,
            fontSize: 20,
          ),
        ),
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
                hintText: 'Search food',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: neutralGrey, // Change color to purple when focused
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  Chip(
                    label: Text('Dinner Food'),
                    backgroundColor: Color(0xffF3F1F1),
                  ),
                  Chip(
                      label: Text('Economic Food'),
                      backgroundColor: Color(0xffF3F1F1)),
                  Chip(
                    label: Text('Hot Food'),
                    backgroundColor: Color(0xffF3F1F1),
                  ),
                  Chip(
                    label: Text('Family Food'),
                    backgroundColor: Color(0xffF3F1F1),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  final food = foods[index];
                  return GestureDetector(
                    onTap: () => _showFoodDetails(context, food, quantity),
                    child: Card(
                      color: primaryColorLT,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8.0)),
                            child: Image.asset(
                              food['image'],
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  food['name'],
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      food['rating'].toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  food['price'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

  void _showFoodDetails(
      BuildContext context, Map<String, dynamic> food, int quantity) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Allows the modal to be full screen if necessary
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
              initialChildSize:
                  0.6, // Initial height is 50% of the screen height
              minChildSize: 0.5, // Minimum height is 25% of the screen height
              maxChildSize: 0.7, // Maximum height is 90% of the screen height

              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                        child: Image.asset(
                          food['image'],
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      food['name'],
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.star,
                                            color: Colors.amber, size: 20),
                                        const SizedBox(width: 4),
                                        Text(
                                          food['rating'].toString(),
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      food['price'],
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            // Decrease quantity logic
                                            setState(() {
                                              if (quantity > 1) {
                                                quantity--;
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.remove_circle),
                                        ),
                                        Text('$quantity'), // Quantity text
                                        IconButton(
                                          color: mainColor,
                                          onPressed: () {
                                            // Increase quantity logic
                                            setState(() {
                                              quantity++;
                                            });
                                          },
                                          icon: const Icon(Icons.add_circle),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Place order logic
                                showSnackbar(
                                  message: 'Successfully placed order',
                                  error: false,
                                );
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: mainColor,
                                minimumSize: const Size(double.infinity, 50),
                              ),
                              child: const Text(
                                'Place Order',
                                style: TextStyle(
                                    fontSize: 18, color: primaryColorLT),
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
