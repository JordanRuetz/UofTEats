import 'package:flutter/material.dart';

import 'package:uoft_eats/client/MainDrawer.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OrdersScreenState createState() => new _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: new MainDrawer(),
        appBar: AppBar(
          title: Text("Orders"),
        ),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text(
                'PLACEHOLDER',
              ),
            ],
          ),
        ));
  }
}
