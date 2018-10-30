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
              OrderByTime(),
              OrderByQuantity()
            ],
          ),
        ),
      ),
    );
  }
}

class OrderByTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
        children: <Widget>[
          new OrderCard(
              name: "Wilbert",
              time: "7:36PM, Oct 29, 2018",
              price: "\$ 15.00",
              orderContents: "1 x Small Poutine\n2 x Hot Dog\n2 x Fanta Pop"
          ),
          new OrderCard(
              name: "Anna",
              time: "6:21PM, Oct 29, 2018",
              price: "\$ 5.00",
              orderContents: "1 x Medium Poutine"
          ),
          new OrderCard(
              name: "Jordan",
              time: "5:43PM, Oct 29, 2018",
              price: "\$ 6.50",
              orderContents: "1 x Hot Dog & Fries"
          ),
          new OrderCard(
              name: "Finnbarr",
              time: "4:10PM, Oct 29, 2018",
              price: "\$ 7.25",
              orderContents: "1 x Fish & Chips\n\t- with extra chips"
          ),
          new OrderCard(
              name: "Kara",
              time: "3:59PM, Oct 29, 2018",
              price: "\$ 5.00",
              orderContents: "1 x Medium Poutine"
          ),
          // Added another to test scroll-ability
          new OrderCard(
              name: "Kara",
              time: "3:32PM, Oct 29, 2018",
              price: "\$ 3.00",
              orderContents: "3 x Coke Diet"
          )
        ]
    );
  }

}

class OrderByQuantity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
        children: <Widget>[
          new ItemCard(
            name: "Medium Poutine",
            quantity: 53,
            revenue: 265.0,
          ),
          new ItemCard(
            name: "All-Beef Hot Dog",
            quantity: 49,
            revenue: 147.0,
          ),
          new ItemCard(
            name: "Hot Dog with Fries",
            quantity: 48,
            revenue: 288.0,
          ),
          new ItemCard(
            name: "Cheeseburger with Fries",
            quantity: 34,
            revenue: 221.0,
          ),
          new ItemCard(
            name: "Small Poutine",
            quantity: 32,
            revenue: 144.0,
          ),
          new ItemCard(
            name: "Large Poutine",
            quantity: 30,
            revenue: 180.0,
          ),
          new ItemCard(
            name: "Veggie Hot Dog",
            quantity: 15,
            revenue: 45.0,
          ),
        ]
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
  final int quantity;
  final double revenue;

  const ItemCard({Key key, this.name, this.quantity, this.revenue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.all(20.0),
                child: new Row(
                    children: <Widget>[
                      // Icon
                      Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Text("$quantity", style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 48.0))
                      ),
                      // Order
                      Container(
                        width: 220.0,
                        padding: const EdgeInsets.only(right: 5.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Name
                            Text("$name",
                                style: new TextStyle(fontSize: 26.0)),
                          ],
                        ),
                      ),
                      // Price
                      Text("Revenue:\n\$$revenue", textAlign: TextAlign.center,
                          style: new TextStyle(fontWeight: FontWeight.w100))
                    ]
                )
            ),
          ],
        )
    );
  }
}