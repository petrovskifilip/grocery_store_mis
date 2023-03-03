import 'package:flutter/material.dart';

import '../models/item.dart';

class OrderItemsList extends StatelessWidget {
  final List<Item> items;

  const OrderItemsList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.category),
            trailing: Text('\$${item.price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
