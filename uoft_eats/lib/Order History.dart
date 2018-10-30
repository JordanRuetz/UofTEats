import 'package:flutter/material.dart';

void main() => runApp(new OrderHistory());

class OrderHistory extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "BY DATE"),
                Tab(text: "BY QUANTITY"),
              ],
            ),
            title: Text("ORDER HISTORY"),
          ),
          body: TabBarView(
            children: [
              ListView(
                children: <Widget>[
                  new ItemCard(
                    name: "Wilbert",
                    time: "7:36PM, Oct 29, 2018",
                    price: "\$ 15.00",
                    orderContents: "1 x Small Poutine\n2 x Hot Dog\n2 x Fanta Pop"
                  ),
                  new ItemCard(
                      name: "Anna",
                      time: "6:21PM, Oct 29, 2018",
                      price: "\$ 5.00",
                      orderContents: "1 x Medium Poutine"
                  ),
                  new ItemCard(
                      name: "Jordan",
                      time: "5:43PM, Oct 29, 2018",
                      price: "\$ 6.50",
                      orderContents: "1 x Hot Dog & Fries"
                  ),
                  new ItemCard(
                      name: "Finnbarr",
                      time: "4:10PM, Oct 29, 2018",
                      price: "\$ 7.25",
                      orderContents: "1 x Fish & Chips\n\t- with extra chips"
                  ),
                  new ItemCard(
                      name: "Kara",
                      time: "3:59PM, Oct 29, 2018",
                      price: "\$ 5.00",
                      orderContents: "1 x Medium Poutine"
                  ),
                  // Added another to test scroll-ability
                  new ItemCard(
                      name: "Kara",
                      time: "3:32PM, Oct 29, 2018",
                      price: "\$ 3.00",
                      orderContents: "3 x Coke Diet"
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String name;
  final String time;
  final String price;
  final String orderContents;

  OrderCard(
      {Key key, this.name, this.time, this.price, this.orderContents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20.0),
            child: new Row(
              children: <Widget>[
                // Icon
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 25.0, 5.0),
                  child: Icon(Icons.check_circle_outline),
                ),
                // Order
                Padding(
                  padding: const EdgeInsets.only(right: 100.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Name
                      Text("$name",
                          style: new TextStyle(fontSize: 28.0,
                              fontWeight: FontWeight.bold)),
                      // Order
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("$time\n$orderContents"),
                      ),
                    ],
                  ),
                ),
                // Price
                new Text("$price"),
              ]
            ),
          ),
        ],
      )
    );
  }
}

class ItemCard extends StatelessWidget {
  final String name;
  final String time;
  final String price;
  final String orderContents;

  ItemCard(
      {Key key, this.name, this.time, this.price, this.orderContents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20.0),
              child: new Row(
                  children: <Widget>[
                    // Icon
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 25.0, 5.0),
                      child: Icon(Icons.check_circle_outline),
                    ),
                    // Order
                    Padding(
                      padding: const EdgeInsets.only(right: 100.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Name
                          Text("$name",
                              style: new TextStyle(fontSize: 28.0,
                                  fontWeight: FontWeight.bold)),
                          // Order
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("$time\n$orderContents"),
                          ),
                        ],
                      ),
                    ),
                    // Price
                    new Text("$price"),
                  ]
              ),
            ),
          ],
        )
    );
  }
}