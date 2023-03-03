import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:grocery_store_mis/services/data_init.dart';

import '../models/order.dart';
import 'items_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalNotificationsPlugin().initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Order order = Order(items: [], shippingAddress: "", date: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '181063 - project',
      theme: ThemeData(
        primarySwatch: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
        ),
      ),
      // home: ItemsScreen(order: order, items: itemsList),
      home: ItemsScreen(order: order, items: DataInit.itemsList),
    );
  }
}
