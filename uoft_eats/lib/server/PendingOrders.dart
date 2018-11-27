import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:uoft_eats/server/ServerDrawer.dart';
import 'ReceiptHeaders.dart';
import 'FoodOrdered.dart';

class PendingOrders extends StatefulWidget {
  final Map<int, Tuple2<String, Map<String, List>>> customerOrders;
  final double taxPercent;
  AsyncSnapshot<QuerySnapshot> snapshot;

  PendingOrders({Key key, this.customerOrders, this.taxPercent, this.snapshot})
      : super(key: key);

  @override
  _PendingOrders createState() => new _PendingOrders();
}

class _PendingOrders extends State<PendingOrders> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Pending Orders"),
        ),
        drawer: ServerDrawer(),
        body: OrderBody(
            customerOrders: widget.customerOrders,
            taxPercent: widget.taxPercent, snapshot: widget.snapshot));
    }
}


class OrderBody extends StatefulWidget {
  final Map<int, Tuple2<String, Map<String, List>>> customerOrders;
  double taxPercent;
  AsyncSnapshot<QuerySnapshot> snapshot;

  OrderBody({this.customerOrders, this.taxPercent, this.snapshot});

  @override
  State<StatefulWidget> createState() {
    return _OrderBodyState();
  }
}

class _OrderBodyState extends State<OrderBody> {
  Map<int, Tuple2<String, Map<String, List>>> customerOrders;

  void _completeOrder(int order) {

      for (int i = 0; i < widget.snapshot.data.documents.length; i++) {
        if (widget.snapshot.data.documents[i]['orderNumber'] == order) {
          var documentID = widget.snapshot.data.documents[i].documentID;
          Firestore.instance.collection('orders').document(documentID).updateData({'status': 1});
        }
      }

      Navigator.pushReplacementNamed(
          context,'/server/orders');

  }

  List<Widget> _getAllOrders() {
    customerOrders = widget.customerOrders;
    List<int> orderNumbers = (customerOrders).keys.toList();
    orderNumbers.sort();

    List<Widget> fullList = new List<Widget>();

    for (int order in orderNumbers) {
      Tuple2<String, Map<String, List>> singleOrder = customerOrders[order];
      String customerName = singleOrder.item1;
      Map<String, List> customerOrder = singleOrder.item2;

      fullList.add(new Column(children: <Widget>[
        new Align(
            alignment: Alignment.topRight,
            child: new Text("Order#" + order.toString(),
                style: new TextStyle(fontSize: 16.0))),
        new Align(
          alignment: Alignment.topLeft,
          child: new Text("Customer: " + customerName,
              style:
                  new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        ),
        ReceiptHeaders(),
        new Divider(color: Colors.blue),
        FoodOrdered(order: customerOrder, taxPercent: widget.taxPercent),
        new RaisedButton(child: new Text("Complete Order#" + order.toString()), onPressed: () {_completeOrder(order);}
        ),
        new Divider(color: Colors.black87),
        new SizedBox(
          height: 12.0,
        )
      ]));
    }
    return fullList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: new EdgeInsets.all(20.0),
        child: new ListView(
          children: _getAllOrders(),
        ));
  }
}
