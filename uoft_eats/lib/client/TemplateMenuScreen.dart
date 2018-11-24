import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:uoft_eats/client/MainDrawer.dart';

class TemplateMenuScreen extends StatefulWidget {
  TemplateMenuScreen(
      {Key key, this.title, this.name, this.color, this.menuStream})
      : super(key: key);

  final String title;
  final String name;
  final int color;
  final Stream<QuerySnapshot> menuStream;

  @override
  _MyTemplateMenuScreenState createState() => new _MyTemplateMenuScreenState();
}

class _MyTemplateMenuScreenState extends State<TemplateMenuScreen> {
  Map order = new Map();
  double _subtotal = 0.00;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.name + ' Menu'),
        backgroundColor: Color(widget.color),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: widget.menuStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return _newMenuItemTile(document);
                }).toList(),
              );
          }
        },
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 15.0, left: 45.0, right: 45.0),
          child: FloatingActionButton(
            onPressed: () {
              // TODO: push necessary data to paymentConfirmation ...
              // TODO: ... build on simple data stored in "order"
              Navigator.pushNamed(context, '/client/paymentConfirmation');
            },
            child: new Text('Checkout \$${_subtotal.toStringAsFixed(2)}'),
            backgroundColor: Colors.green,
            shape: StadiumBorder(),
          )),
      drawer: MainDrawer(),
    );
  }

  ExpansionTile _newMenuItemTile(DocumentSnapshot document) {
    return ExpansionTile(
      leading: Icon(
        document['foodOrDrink'] ? Icons.fastfood : Icons.local_drink,
      ),
      title: Text(document['name'].toString()),
      backgroundColor: Colors.white70,
      children: _generateItemTile(document),
    );
  }

  List<Widget> _generateItemTile(DocumentSnapshot document) {
    Map pricingMap = Map.from(document['pricing']);
    List<Widget> returnList = new List(pricingMap.length);

    List sizes = pricingMap.keys.toList();
    List prices = pricingMap.values.toList();

    for (int i = 0; i < pricingMap.length; i++) {
      // Initialize 'order' with a key for every size + item combo
      // corresponding to a value representing quantity of combo in order
      order.putIfAbsent(sizes[i] + ' ' + document['name'].toString(), () => 0);
      String itemName = document['name'];

      returnList[i] = new ListTile(
        trailing: new Row(
          children: <Widget>[
            new Text(sizes[i]),
            Spacer(flex: 5),
            new Text('\$${prices[i].toStringAsFixed(2)}'),
            Spacer(flex: 5),
            order[sizes[i] + ' ' + itemName] != 0
                ? new IconButton(
                    icon: new Icon(Icons.remove),
                    onPressed: () => setState(() {
                          _subtotal -= prices[i];
                          order[sizes[i] + ' ' + itemName] -= 1;
                        }),
                  )
                : new Container(),
            new Text(order[sizes[i] + ' ' + itemName].toString()),
            new IconButton(
                icon: new Icon(Icons.add),
                onPressed: () => setState(() {
                      _subtotal += prices[i];
                      order[sizes[i] + ' ' + itemName] += 1;
                    }))
          ],
        ),
      );
    }

    return returnList;
  }
}
