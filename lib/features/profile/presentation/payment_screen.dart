import 'package:flutter/material.dart';
import 'package:madang/utils/theme/theme.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        title: const Text(
          'Payment Method',
          style: TextStyle(color: primaryColorDK),
        ),
        iconTheme: const IconThemeData(color: primaryColorDK),
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            RadioListTile<String>(
              value: 'Credit Card',
              groupValue: _selectedPaymentMethod,
              activeColor: mainColor,
              title: const Row(
                children: [
                  Icon(Icons.credit_card, color: neutralGrey),
                  SizedBox(width: 10),
                  Text('Credit Card'),
                ],
              ),
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            Container(
              margin: const EdgeInsets.only(left: 60.0),
              child: const Divider(color: neutralGrey, height: 1),
            ),
            RadioListTile<String>(
              value: 'Wallet',
              groupValue: _selectedPaymentMethod,
              activeColor: mainColor,
              title: const Row(
                children: [
                  Icon(Icons.account_balance_wallet, color: neutralGrey),
                  SizedBox(width: 10),
                  Text('Wallet'),
                ],
              ),
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            Container(
              margin: const EdgeInsets.only(left: 60.0),
              child: const Divider(color: neutralGrey, height: 1),
            ),
            RadioListTile<String>(
              value: 'PayPal',
              groupValue: _selectedPaymentMethod,
              activeColor: mainColor,
              title: const Row(
                children: [
                  Icon(Icons.paypal, color: neutralGrey),
                  SizedBox(width: 10),
                  Text('PayPal'),
                ],
              ),
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
            ),
            Container(
              margin: const EdgeInsets.only(left: 60.0),
              child: const Divider(color: neutralGrey, height: 1),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _selectedPaymentMethod == null
                    ? null
                    : () {
                        // Handle Pay Now
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _selectedPaymentMethod == null ? neutralGrey : mainColor,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(fontSize: 18, color: primaryColorLT),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
