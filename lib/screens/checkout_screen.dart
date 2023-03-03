import 'package:flutter/material.dart';

import '../models/order.dart';
import '../widgets/checkout_form.dart';
import '../widgets/orders_items_list.dart';

class CheckoutScreen extends StatelessWidget {
  final Order order;

  const CheckoutScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            OrderItemsList(items: order.items),
            const SizedBox(height: 16),
            Text(
              'Total Price',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '\$${order.totalPriceSum.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            CheckoutForm(order: order),
          ],
        ),
      ),
    );
  }
}
