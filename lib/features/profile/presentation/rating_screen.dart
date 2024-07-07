import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class GiveRatingScreen extends StatefulWidget {
  @override
  _GiveRatingScreenState createState() => _GiveRatingScreenState();
}

class _GiveRatingScreenState extends State<GiveRatingScreen> {
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        title:
            const Text('Give Rating', style: TextStyle(color: primaryColorDK)),
        iconTheme: const IconThemeData(color: primaryColorDK),
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rate Our Service',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Please provide your feedback by rating our service.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Slider(
              value: _rating,
              activeColor: mainColor,
              onChanged: (newRating) {
                setState(() => _rating = newRating);
              },
              min: 0,
              max: 5,
              divisions: 5,
              label: '$_rating',
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle Submit Rating
                },
                style: ElevatedButton.styleFrom(backgroundColor: mainColor),
                child: const Text(
                  'Submit Rating',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: primaryColorLT),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
