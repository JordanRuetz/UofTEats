import 'package:flutter/material.dart';

import 'ClientReceipt.dart';

class ReceiptScreen extends StatefulWidget {
  ReceiptScreen({Key key, this.title}) : super(key: key);

  final String title;

  static final int orderNum = 12;
  static final String foodTruck = "Ideal Catering";
  static final double tax = 0.00;
  static final Map<String, List> singleOrder = {
    "Poutine": ["M", 1, 4.50],
    "Hot Dog": ["S", 2, 2.50]
  };

  @override
  _ReceiptScreenState createState() => new _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    return ClientReceipt(
        orderNum: ReceiptScreen.orderNum,
        foodTruck: ReceiptScreen.foodTruck,
        order: ReceiptScreen.singleOrder,
        tax: ReceiptScreen.tax);
  }
}
