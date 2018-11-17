import 'package:flutter/material.dart';

class ReceiptHeaders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReceiptHeaders();
  }
}

class _ReceiptHeaders extends State<ReceiptHeaders> {
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


