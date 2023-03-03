import 'package:flutter/material.dart';

import '../models/item.dart';
import '../models/order.dart';
import '../widgets/item_card.dart';
import 'checkout_screen.dart';

class ItemsScreen extends StatefulWidget {
  final Order order;
  final List<Item> items;

  const ItemsScreen({Key? key, required this.order, required this.items})
      : super(key: key);

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery store'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        padding: const EdgeInsets.all(16),
        children: widget.items
            .map((item) => ItemCard(
                  item: item,
                  onPressed: () {
                    setState(() {
                      widget.order.addItem(item);
                    });
                  },
                ))
            .toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total price: \$${widget.order.totalPriceSum.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutScreen(order: widget.order),
                    ),
                  );
                },
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
