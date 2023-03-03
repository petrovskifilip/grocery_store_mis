import 'item.dart';

class Order {
  final List<Item> items;
  double totalPrice;
  String shippingAddress;
  final DateTime date;

  Order(
      {required this.items,
      required this.shippingAddress,
      required this.date,
      this.totalPrice = 0});

  int get itemCount => items.length;

  double get totalPriceSum {
    return items.fold(0, (total, item) => total + item.price);
  }

  void addItem(Item item) {
    items.add(item);
  }
}
