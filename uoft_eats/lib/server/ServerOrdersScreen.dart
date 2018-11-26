import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'PendingOrders.dart';

class ServerOrdersScreen extends StatefulWidget {
  ServerOrdersScreen({Key key, this.title}) : super(key: key);

  final String title;

  static final double taxPercent = 0.13;
  // key is the order number. Map is unsorted
  static final Map<int, Tuple2<String, Map<String, List>>> customerOrders = {
    215: new Tuple2<String, Map<String, List>>("Anna", {
      "Poutine": ["M", 1, 5.00],
      "Hot Dog": ["S", 1, 2.50],
      "Water": ["N/A", 1, 1.00]
    }),
    216: new Tuple2<String, Map<String, List>>("Kara", {
      "Cheeseburger": ["N/A", 1, 5.00],
      "Soda": ["N/A", 2, 2.00]
    }),
    218: new Tuple2<String, Map<String, List>>("Jordan", {
      "Hamburger and Fries": ["S", 1, 5.50],
      "Soda": ["N/A", 1, 2.00]
    }),
    219: new Tuple2<String, Map<String, List>>("Wilbert", {
      "Bacon Poutine": ["L", 1, 7.50]
    }),
    217: new Tuple2<String, Map<String, List>>("Finnbarr", {
      "Chicken Poutine": ["M", 1, 7.00],
      "Water": ["N/A", 1, 1.00]
    })
  };

  @override
  _MyServerOrdersScreenState createState() => new _MyServerOrdersScreenState();
}

class _MyServerOrdersScreenState extends State<ServerOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return new PendingOrders(
        customerOrders: ServerOrdersScreen.customerOrders,
        taxPercent: ServerOrdersScreen.taxPercent);
  }
}

