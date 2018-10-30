import 'package:flutter/material.dart';

import 'package:uoft_eats/client/MainDrawer.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PaymentScreenState createState() => new _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: new MainDrawer(),
        appBar: AppBar(
          title: Text("Payment"),
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
