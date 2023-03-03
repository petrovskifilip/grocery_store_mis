import 'package:flutter/material.dart';
import '../widgets/success_message.dart';

class OrderSuccessScreen extends StatelessWidget {
  final String address;

  const OrderSuccessScreen({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return SuccessMessage(address: address);
  }
}
