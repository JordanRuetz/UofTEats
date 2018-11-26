import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:uoft_eats/server/ServerDrawer.dart';

class QuantitiesOrderedScreen extends StatefulWidget {
  QuantitiesOrderedScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyQuantitiesOrderedScreenState createState() =>
      new _MyQuantitiesOrderedScreenState();
}

class _MyQuantitiesOrderedScreenState extends State<QuantitiesOrderedScreen> {
  List<NewMenuItemTile> menuItems = new List();

  String server = "ideal catering";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new ServerDrawer(),
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("orders").where("server", isEqualTo: server).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');
              default: {

                  return NewMenuItemTile("something", 7, true);
                }

                //return NewMenuItemTile("something", 7, true);
            }
          },
        ),

/*        new ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children:


          <Widget>[
            NewMenuItemTile('Poutine', 7, true),
            NewMenuItemTile('Burger', 4, true),
            NewMenuItemTile('Fries', 11, true),
            NewMenuItemTile('Drink', 14, false),
          ],
        ));*/
  }
}

class NewMenuItemTile extends StatefulWidget {
  final String title;
  int quantity;
  final bool foodOrDrink;

  NewMenuItemTile(this.title, this.quantity, this.foodOrDrink);

  @override
  _NewMenuItemTileState createState() => new _NewMenuItemTileState();
}

class _NewMenuItemTileState extends State<NewMenuItemTile> {
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: Icon(
        widget.foodOrDrink ? Icons.fastfood : Icons.local_drink,
      ),
      title: new Text(widget.title),
      trailing: new Text(widget.quantity.toString()),
      onTap: () => setState(() => widget.quantity--),
    );
  }
}
