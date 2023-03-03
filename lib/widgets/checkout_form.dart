import 'package:flutter/material.dart';

import '../models/order.dart';
import '../screens/order_success_screen.dart';

class CheckoutForm extends StatefulWidget {
  final Order order;

  const CheckoutForm({Key? key, required this.order}) : super(key: key);

  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  late TextEditingController _shippingAddressController;

  @override
  void initState() {
    super.initState();
    _shippingAddressController = TextEditingController(
        text: widget.order.shippingAddress); // set initial value of controller
  }

  @override
  void dispose() {
    _shippingAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping Address',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextField(
          controller: _shippingAddressController,
          decoration: const InputDecoration(
            hintText: 'Enter your shipping address',
          ),
          onChanged: (value) {
            setState(() {
              widget.order.shippingAddress = value;
            });
          },
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderSuccessScreen(
                  address: widget.order.shippingAddress,
                ),
              ),
            );
          },
          child: const Text('Submit Order'),
        ),
      ],
    );
  }
}
