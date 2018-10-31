import 'package:flutter/material.dart';

import 'package:uoft_eats/server/ServerDrawer.dart';

class ServerOrdersScreen extends StatefulWidget {
  ServerOrdersScreen({Key key, this.title}) : super(key: key);

  final String title;

  static final int numOrders = 215;
  static final double taxPercent = 0.13;
  static final Map<String, Map<String, List>> customerOrders = {
    "Anna": {
      "Poutine": ["M", 1, 5.00],
      "Hot Dog": ["S", 1, 2.50],
      "Water": ["N/A", 1, 1.00]
    },
    "Kara": {
      "Cheeseburger": ["N/A", 1, 5.00],
      "Soda": ["N/A", 2, 2.00]
    },
    "Jordan": {
      "Hamburger and Fries": ["S", 1, 5.50],
      "Soda": ["N/A", 1, 2.00]
    },
    "Wilbert": {
      "Bacon Poutine": ["L", 1, 7.50]
    },
    "Finnbarr": {
      "Chicken Poutine": ["M", 1, 7.00],
      "Water": ["N/A", 1, 1.00]
    }
  };

  @override
  _MyServerOrdersScreenState createState() => new _MyServerOrdersScreenState();
}

class _MyServerOrdersScreenState extends State<ServerOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return new MyPendingOrders(
        numOrders: ServerOrdersScreen.numOrders,
        customerOrders: ServerOrdersScreen.customerOrders,
        taxPercent: ServerOrdersScreen.taxPercent);
  }
}

class MyPendingOrders extends StatelessWidget {
  final int numOrders;
  final Map<String, Map<String, List>> customerOrders;
  final double taxPercent;

  MyPendingOrders(
      {Key key, this.numOrders, this.customerOrders, this.taxPercent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Pending Orders"),
        ),
        drawer: ServerDrawer(),
        body: OrderBody(
            numOrders: numOrders,
            customerOrders: customerOrders,
            taxPercent: taxPercent));
  }
}

class OrderBody extends StatefulWidget {
  int numOrders;
  Map<String, Map<String, List>> customerOrders;
  double taxPercent;

  OrderBody({this.numOrders, this.customerOrders, this.taxPercent});

  @override
  State<StatefulWidget> createState() {
    return _OrderBodyState();
  }
}

class _OrderBodyState extends State<OrderBody> {
  void _incrementOrderNum() {
    widget.numOrders++;
  }

  List<Widget> _getAllOrders() {
    List<String> customerNames = (widget.customerOrders).keys.toList();

    List<Widget> fullList = new List<Widget>();
    for (String name in customerNames) {
      _incrementOrderNum();
      Map<String, List> singleOrder = widget.customerOrders[name];
      fullList.add(new Column(children: <Widget>[
        new Align(
            alignment: Alignment.topRight,
            child: new Text("Order#" + widget.numOrders.toString(),
                style: new TextStyle(fontSize: 16.0))),
        new Align(
          alignment: Alignment.topLeft,
          child: new Text("Customer: " + name,
              style:
                  new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        ),
        ReceiptHeaders(),
        new Divider(color: Colors.blue),
        FoodOrdered(order: singleOrder, taxPercent: widget.taxPercent),
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

class ReceiptHeaders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.only(top: 20.0),
        child: new Row(
          children: <Widget>[
            new Container(
                child: new Text("Item", style: new TextStyle(fontSize: 16.0)),
                padding: new EdgeInsets.only(right: 80.0)),
            new Container(
                child: new Text("Size", style: new TextStyle(fontSize: 16.0)),
                padding: new EdgeInsets.only(right: 50.0)),
            new Container(
                child:
                    new Text("Quantity", style: new TextStyle(fontSize: 16.0)),
                padding: new EdgeInsets.only(right: 38.0)),
            new Container(
                child: new Text("Price", style: new TextStyle(fontSize: 16.0)))
          ],
        ));
  }
}

class FoodOrdered extends StatelessWidget {
  final Map<String, List> order;
  final double taxPercent;
  final double listSpacing = 12.0;

  FoodOrdered({Key key, this.order, this.taxPercent}) : super(key: key);

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
    double tax = subtotal * taxPercent;
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
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getSizes(order)),
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getQuantities(order)),
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
