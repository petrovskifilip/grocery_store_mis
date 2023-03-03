import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentService {
  static const _publishableKey = 'mock key';

  static Future<void> init() async {
    Stripe.publishableKey = _publishableKey;
  }

  static Future<void> makePayment(
      BuildContext context, double amount, String email) async {
    // Create token
    final token = await Stripe.instance.createToken(const CardTokenParams(
        currency: "EUR",
        name: "name",
        type: TokenType.BankAccount) as CreateTokenParams);

    // Make payment
    final response = await http.post(
      Uri.parse('https://your-server.com/process-payment'),
      body: {
        'amount': (amount * 100).toString(),
        'token': "token",
        'email': email,
      },
    );

    // Handle payment response
    if (response.statusCode == 200) {
      // Payment was successful, show confirmation message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Payment successful"),
          content: Text("Your order has been submitted."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      // Payment failed, show error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Payment failed"),
          content: Text("There was an error processing your payment."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}
