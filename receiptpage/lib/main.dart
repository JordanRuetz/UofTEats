import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Receipt"),
          ),
          body: MyReceipt()),
    );
  }
}

class MyReceipt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: new EdgeInsets.all(20.0),
        child: new ListView(
          children: <Widget>[
            new Align(
                alignment: Alignment.topRight,
                child:
                    new Text("Order#12", style: new TextStyle(fontSize: 16.0))),
            new Align(
              alignment: Alignment.topLeft,
              child: new Text("The Blue Truck",
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
            ReceiptHeaders(),
            new Divider(color: Colors.blue),
            FoodOrdered(),
            new Divider(color: Colors.grey),
            new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Container(
                      padding: new EdgeInsets.only(top: 10.0, bottom: 12.0),
                      child: new Text("Subtotal: \$9.50")),
                  new Container(
                    padding: new EdgeInsets.only(bottom: 12.0),
                    child: new Text("Tax: \$0.00"))
                ]),
            new Divider(color: Colors.grey),
            new Container(padding: new EdgeInsets.only(top: 10.0),
            child: new Text("Total: \$9.50", textAlign: TextAlign.end,),),
            QRcode()
          ],
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
                padding: new EdgeInsets.only(right: 40.0)),
            new Container(
                child: new Text("Price", style: new TextStyle(fontSize: 16.0)))
          ],
        ));
  }
}

class FoodOrdered extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
                padding: new EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: new Row(
                  children: <Widget>[
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                            padding: new EdgeInsets.only(bottom: 12.0),
                            child: new Text("Poutine")),
                        new Container(
                            padding: new EdgeInsets.only(bottom: 12.0),
                            child: new Text("Hot Dog"))
                      ],
                    ),
                    SizedBox(width: 60.0),
                    new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                              padding: new EdgeInsets.only(bottom: 12.0),
                              child: new Text("Med.")),
                          new Container(
                              padding: new EdgeInsets.only(bottom: 12.0),
                              child: new Text("N/A"))
                        ]),
                    SizedBox(width: 70.0),
                    new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                              padding: new EdgeInsets.only(bottom: 12.0),
                              child: new Text("1x")),
                          new Container(
                              padding: new EdgeInsets.only(bottom: 12.0),
                              child: new Text("2x"))
                        ]),
                    SizedBox(width: 65.0),
                    new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                              padding: new EdgeInsets.only(bottom: 12.0),
                              child: new Text("\$4.50")),
                          new Container(
                              padding: new EdgeInsets.only(bottom: 12.0),
                              child: new Text("\$2.50"))
                        ]),
                  ],
                ));
  }

}

class QRcode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(padding: new EdgeInsets.all(50.0),
      child: new Image.network("https://www.qrstuff.com/images/sample.png"));
  }

}