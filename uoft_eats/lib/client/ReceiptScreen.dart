import 'package:flutter/material.dart';

import 'package:uoft_eats/client/MainDrawer.dart';

class ReceiptScreen extends StatefulWidget {
  ReceiptScreen({Key key, this.title}) : super(key: key);

  final String title;

  static final int orderNum = 12;
  static final String foodTruck = "Ideal Catering";
  static final double tax = 0.91;
  static final Map<String, List> singleOrder = {
    "Poutine": ["M", 1, 3.50],
    "Burger": ["S", 1, 2.50],
    "Drink": ["S", 1, 1.00],
  };

  @override
  _ReceiptScreenState createState() => new _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    return MyReceipt(
        orderNum: ReceiptScreen.orderNum,
        foodTruck: ReceiptScreen.foodTruck,
        order: ReceiptScreen.singleOrder,
        tax: ReceiptScreen.tax);
  }
}

class MyReceipt extends StatelessWidget {
  final int orderNum;
  final String foodTruck;
  final Map<String, List> order;
  final double tax;

  MyReceipt({Key key, this.orderNum, this.foodTruck, this.order, this.tax})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Receipt #$orderNum"),
          backgroundColor: Colors.brown,
        ),
        drawer: MainDrawer(),
        body: Container(
            padding: new EdgeInsets.all(20.0),
            child: new ListView(
              children: <Widget>[
                new Align(
                    alignment: Alignment.topRight,
                    child: new Text("Order#$orderNum",
                        style: new TextStyle(fontSize: 16.0))),
                new Align(
                  alignment: Alignment.topLeft,
                  child: new Text("$foodTruck",
                      style: new TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                //ReceiptHeaders(),
                new Divider(color: Colors.blue),
                FoodOrdered(order: order, tax: tax),
              ],
            )));
  }
}

class ReceiptHeaders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.only(top: 20.0),
        child: new Row(
          children: <Widget>[
                new Text("Item", style: new TextStyle(fontSize: 16.0)),
                new Spacer(),
                /*new Text("Size", style: new TextStyle(fontSize: 16.0)),
                new Spacer(),
                new Text("Quantity", style: new TextStyle(fontSize: 16.0)),
                new Spacer(),*/
                new Text("Price", style: new TextStyle(fontSize: 16.0)),
          ],
        ));
  }
}

class FoodOrdered extends StatelessWidget {
  final Map<String, List> order;
  final double tax;
  final double listSpacing = 12.0;

  FoodOrdered({Key key, this.order, this.tax}) : super(key: key);

  List<Widget> _getItems(Map<String, List> order) {
    List<String> listOfItems = (order.keys).toList();
    List<Widget> orderWidgets = new List<Widget>();
    for (var i = 0; i < listOfItems.length; i++) {
      orderWidgets.add(new Container(
          width: 120.0,
          padding: new EdgeInsets.only(bottom: listSpacing),
          child: new Text(listOfItems[i])));
    }
    return orderWidgets;
  }

  List<Widget> _getSizes(Map<String, List> order) {
    List<String> listOfItems = (order.keys).toList();
    List<Widget> sizeWidgets = new List<Widget>();
    for (String item in listOfItems) {
      sizeWidgets.add(new Container(
          width: 95.0,
          padding: new EdgeInsets.only(bottom: listSpacing),
          child: new Text(order[item][0])));
    }
    return sizeWidgets;
  }

  List<Widget> _getQuantities(Map<String, List> order) {
    List<String> listOfItems = (order.keys).toList();
    List<Widget> quantityWidgets = new List<Widget>();
    for (String item in listOfItems) {
      String num = (order[item][1]).toString();
      quantityWidgets.add(new Container(
          width: 82.0,
          padding: new EdgeInsets.only(bottom: listSpacing),
          child: new Text(num + "x")));
    }
    return quantityWidgets;
  }

  List<Widget> _getPrices(Map<String, List> order) {
    List<String> listOfItems = (order.keys).toList();
    List<Widget> priceWidgets = new List<Widget>();
    for (String item in listOfItems) {
      priceWidgets.add(new Container(
          padding: new EdgeInsets.only(bottom: listSpacing),
          child: new Text("\$" + (order[item][2]).toStringAsFixed(2))));
    }
    return priceWidgets;
  }

  Widget _getTotals() {
    List<String> listOfItems = (order.keys).toList();
    double subtotal = 0.00;
    for (String item in listOfItems) {
      List itemInfo = order[item];
      int num = itemInfo[1];
      subtotal += (num * itemInfo[2]);
    }
    double total = (subtotal + tax);

    return new Column(children: <Widget>[
      new Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
        new Container(
            padding: new EdgeInsets.only(top: 10.0, bottom: listSpacing),
            child: new Text("Subtotal: \$" + subtotal.toStringAsFixed(2))),
        new Container(
            padding: new EdgeInsets.only(bottom: listSpacing),
            child: new Text("Tax: \$" + tax.toStringAsFixed(2))),
        new Divider(color: Colors.grey),
        new Container(
          padding: new EdgeInsets.only(top: 10.0),
          child: new Text(
            "Total: \$" + total.toStringAsFixed(2),
            textAlign: TextAlign.end,
          ),
        )
      ])
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getItems(order)),
                new Spacer(),
                /*new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getSizes(order)),
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getQuantities(order)),*/
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getPrices(order)),
              ],
            ),
            new Divider(color: Colors.grey),
            _getTotals(),
          ],
        ));
  }
}