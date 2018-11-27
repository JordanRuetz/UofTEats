
import 'package:flutter/material.dart';
import 'package:uoft_eats/server/ServerDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ServerOrderHistory extends StatefulWidget {
  ServerOrderHistory({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ServerOrderHistoryState createState() => new _ServerOrderHistoryState();
}

class _ServerOrderHistoryState extends State<ServerOrderHistory> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: new ServerDrawer(),
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
    );
  }
}

class OrderByTime extends StatelessWidget {
  Widget _buildOrderCard(BuildContext context, DocumentSnapshot document) {
    List items = document['items'];
    StringBuffer order = new StringBuffer();
    for (final item in items) {
      StringBuffer name = new StringBuffer();
      name.write(item['quantity'].toString() + ' x ');
      if (item['size'] != '-1') {
        name.write(item['size'].toString() + ' ');
      }
      name.write(item['type'].toString() + '\n');
      order.write(name.toString());
    }
    return OrderCard(
      name: document['client'],
      price: document['subtotal'],
      orderContents: order.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('orders').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(
            child: const Text("Loading...",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
        );
        List documents = [];
        for (final document in snapshot.data.documents) {
          if (document['status'].toString() == '2') {
            documents.add(document);
          }
        }
        return new ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            return _buildOrderCard(context, documents[index]);
          },
        );
      },
    );
  }
}



class OrderByQuantity extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('orders').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: const Text("Loading...",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
          );
        }
        List documents = [];
        for (final document in snapshot.data.documents) {
          if (document['status'].toString() == '2') {
            documents.add(document);
          }
        }
        return new ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            return _buildQuantityCard(context, documents[index]);
          },
        );
      },
    );
  }

  _buildQuantityCard(BuildContext context, document) {
//    {Key key, this.name, this.quantity, this.revenue}
  }
//  @override
//  Widget build(BuildContext context) {
//    return new ListView(
//        children: <Widget>[
//          new ItemCard(
//            name: "Medium Poutine",
//            quantity: 53,
//            revenue: 265.0,
//          ),
//          new ItemCard(
//            name: "All-Beef Hot Dog",
//            quantity: 49,
//            revenue: 147.0,
//          ),
//          new ItemCard(
//            name: "Hot Dog with Fries",
//            quantity: 48,
//            revenue: 288.0,
//          ),
//          new ItemCard(
//            name: "Cheeseburger with Fries",
//            quantity: 34,
//            revenue: 221.0,
//          ),
//          new ItemCard(
//            name: "Small Poutine",
//            quantity: 32,
//            revenue: 144.0,
//          ),
//          new ItemCard(
//            name: "Large Poutine",
//            quantity: 30,
//            revenue: 180.0,
//          ),
//          new ItemCard(
//            name: "Veggie Hot Dog",
//            quantity: 15,
//            revenue: 45.0,
//          ),
//        ]
//    );
//  }

}

class OrderCard extends StatelessWidget {
  final String name;
  final String price;
  final String orderContents;

  OrderCard(
      {Key key, this.name, this.price, this.orderContents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 25.0),
      child:
        ListTile(
          leading: Icon(Icons.check_circle_outline),
          title: Text("$name", style: new TextStyle(fontSize: 28.0,
              fontWeight: FontWeight.bold)),
          subtitle: Text("$orderContents"),
        ),
    );
  }
}

class QuantityCard extends StatelessWidget {
  final String name;
  final int quantity;
  final double revenue;

  const QuantityCard(
      {Key key, this.name, this.quantity, this.revenue}) : super(key: key);

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
                          child: Text("$quantity",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green, fontSize: 48.0
                              )
                          )
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
