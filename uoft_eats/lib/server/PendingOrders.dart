import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'package:uoft_eats/server/ServerDrawer.dart';
import 'ReceiptHeaders.dart';
import 'FoodOrdered.dart';

class PendingOrders extends StatefulWidget {
  final Map<int, Tuple2<String, Map<String, List>>> customerOrders;
  final double taxPercent;

  PendingOrders({Key key, this.customerOrders, this.taxPercent})
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
            taxPercent: widget.taxPercent));
  }
}


class OrderBody extends StatefulWidget {
  final Map<int, Tuple2<String, Map<String, List>>> customerOrders;
  double taxPercent;

  OrderBody({this.customerOrders, this.taxPercent});

  @override
  State<StatefulWidget> createState() {
    return _OrderBodyState();
  }
}

class _OrderBodyState extends State<OrderBody> {
  Map<int, Tuple2<String, Map<String, List>>> customerOrders;

  List<Widget> _getAllOrders() {
    customerOrders = widget.customerOrders;
    List<int> orderNumbers = (customerOrders).keys.toList();
    orderNumbers.sort();

    List<Widget> fullList = new List<Widget>();

    fullList.add(new Row(
      children: <Widget>[new RaisedButton(child: new Text("Refresh"), onPressed: () {setState(()
      {});}
      )]
    ));

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
