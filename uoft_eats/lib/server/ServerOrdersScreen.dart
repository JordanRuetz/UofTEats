import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'PendingOrders.dart';

class ServerOrdersScreen extends StatefulWidget {
  ServerOrdersScreen({Key key, this.title, this.name}) : super(key: key);
  final String foodTruck = 'ideal catering';
  final String title;
  final String name;
  static final double taxPercent = 0.13;
  // key is the order number. Map is unsorted
 /* static final Map<int, Tuple2<String, Map<String, List>>> customerOrders = {
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
  };*/

  @override
  _MyServerOrdersScreenState createState() => new _MyServerOrdersScreenState();
}

class _MyServerOrdersScreenState extends State<ServerOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    //look at menuscreen
    // pull at status 0
    // change status to 1 when completed, status 2 when picked up
    // two listviews for both statuse

    Map<int, Tuple2<String, Map<String, List>>> customerOrders = new Map<int, Tuple2<String, Map<String, List>>>();

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('orders')
          .where("status", isEqualTo: 0)
          .where("server", isEqualTo: widget.foodTruck)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        final int count = snapshot.data.documents.length;
        for (int i = 0; i < count; i++) {
          //iterate each document(order)
          Map<String, List> allItems = new Map<String, List>();
          List orderQuery = snapshot.data.documents[i]['items'];
          for (int j = 0; j < orderQuery.length; j++) {
            List ItemInfo = new List(3);;
            if (orderQuery[j]["size"] != "-1") {
              ItemInfo[0] = orderQuery[j]["size"];
            }
            else {
              ItemInfo[0] = "";
            }
            ItemInfo[1] = orderQuery[j]["quantity"];
            ItemInfo[2] = orderQuery[j]["price"];

            allItems[orderQuery[j]["type"]] = ItemInfo;


            Tuple2<String, Map<String, List>> NameToOrder = Tuple2<String,
                Map<String, List>>(
                snapshot.data.documents[i]["client"], allItems);

            customerOrders[snapshot.data.documents[i]['orderNumber']] =
                NameToOrder;
          }
        }

          return new PendingOrders(
              customerOrders: customerOrders,
              taxPercent: ServerOrdersScreen.taxPercent, snapshot: snapshot);

      }

    );

  }
}

