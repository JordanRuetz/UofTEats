import 'package:flutter/material.dart';

import 'package:uoft_eats/client/MainDrawer.dart';

class TemplateMenuScreen extends StatefulWidget {
  TemplateMenuScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyTemplateMenuScreenState createState() => new _MyTemplateMenuScreenState();
}

// TODO: Example template for presenting food data.
// TODO: Will eventually pull data from database to populate.
class _MyTemplateMenuScreenState extends State<TemplateMenuScreen> {
  double _subtotal = 0.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('[FOODTRUCK] Menu'),
        backgroundColor: Colors.brown,
      ),
      body: new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          ListTile(
            leading: const Icon(
              Icons.fastfood,
            ),
            title: const Text('Poutine'),
            subtitle: const Text('\$3.50'),
            onTap: () {
              setState(() {
                _subtotal += 3.5;
              });
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.fastfood,
            ),
            title: const Text('Burger'),
            subtitle: const Text('\$2.50'),
            onTap: () {
              setState(() {
                _subtotal += 2.5;
              });
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.fastfood,
            ),
            title: const Text('Fries'),
            subtitle: const Text('\$1.50'),
            onTap: () {
              setState(() {
                _subtotal += 1.5;
              });
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.local_drink,
            ),
            title: const Text('Anything to drink for you?'),
            subtitle: const Text('\$1.00'),
            onTap: () {
              setState(() {
                _subtotal += 1.0;
              });
            },
          ),
          new Container(
            margin: new EdgeInsets.only(top: 100.0),
            // TODO subtotal needs to display updates
            child: new Text('Subtotal: \$$_subtotal'),
          ),
          new Container(
            margin: new EdgeInsets.all(5.0),
            child: new RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/client/checkout');
              },
              child: new Text('Checkout'),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
