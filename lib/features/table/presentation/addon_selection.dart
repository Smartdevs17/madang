import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class AddonSelection extends StatefulWidget {
  const AddonSelection({Key? key}) : super(key: key);

  @override
  _AddonSelectionState createState() => _AddonSelectionState();
}

class _AddonSelectionState extends State<AddonSelection> {
  bool chairsSelected = false;
  bool tablesSelected = false;
  bool flowersSelected = false;
  int chairsQuantity = 1;
  int tablesQuantity = 1;
  int flowersQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Additional",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        _buildAddonItem(
          "Chairs",
          "Free",
          chairsSelected,
          chairsQuantity,
          (bool? selected) {
            setState(() {
              chairsSelected = selected ?? false;
            });
          },
          () {
            setState(() {
              if (chairsQuantity > 1) {
                chairsQuantity--;
              }
            });
          },
          () {
            setState(() {
              chairsQuantity++;
            });
          },
        ),
        // const SizedBox(height: 5),
        _buildAddonItem(
          "Tables",
          "Free",
          tablesSelected,
          tablesQuantity,
          (bool? selected) {
            setState(() {
              tablesSelected = selected ?? false;
            });
          },
          () {
            setState(() {
              if (tablesQuantity > 1) {
                tablesQuantity--;
              }
            });
          },
          () {
            setState(() {
              tablesQuantity++;
            });
          },
        ),
        // const SizedBox(height: 5),
        _buildAddonItem(
          "Flowers",
          "#2500",
          flowersSelected,
          flowersQuantity,
          (bool? selected) {
            setState(() {
              flowersSelected = selected ?? false;
            });
          },
          () {
            setState(() {
              if (flowersQuantity > 1) {
                flowersQuantity--;
              }
            });
          },
          () {
            setState(() {
              flowersQuantity++;
            });
          },
        ),
      ],
    );
  }

  Widget _buildAddonItem(
    String title,
    String fee,
    bool isSelected,
    int quantity,
    Function(bool?) onChanged,
    VoidCallback onDecrement,
    VoidCallback onIncrement,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  activeColor: mainColor,
                  value: isSelected,
                  onChanged: onChanged,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              fee,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        if (isSelected)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: onDecrement,
                      icon: const Icon(Icons.remove_circle),
                    ),
                    Text('$quantity'),
                    IconButton(
                      color: mainColor,
                      onPressed: onIncrement,
                      icon: const Icon(Icons.add_circle),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: Center(
          child: AddonSelection(),
        ),
      ),
    ));
