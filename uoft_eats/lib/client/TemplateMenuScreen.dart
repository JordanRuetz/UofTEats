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
  List<String> order = new List();
  double _subtotal = 0.00;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Ideal Catering Menu'),
        backgroundColor: Colors.brown,
      ),
      body: new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[

          _newMenuItemTile('Poutine', 3.50, true),
          _newMenuItemTile('Burger', 2.50, true),
          _newMenuItemTile('Fries', 1.50, true),
          _newMenuItemTile('Anything to drink for you?', 1.00, false),

          new Container(
            margin: new EdgeInsets.only(top: 100.0),
            child: new RaisedButton(
              onPressed: () {
                // TODO implement checkout screen and link
                //Navigator.pushNamed(context, '/client/checkout');
              },
              child: new Text('Checkout \$${_subtotal.toStringAsFixed(2)}'),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  CheckboxListTile _newMenuItemTile(
      String title, double price, bool foodOrDrink) {
    return new CheckboxListTile(
      secondary: Icon(
        foodOrDrink ? Icons.fastfood : Icons.local_drink,
      ),
      title: Text('$title'),
      subtitle: Text('\$${price.toStringAsFixed(2)}'),
      value: order.contains('$title'),
      onChanged: (bool value) {
        setState(() {
          if (value) {
            order.add('$title');
            _subtotal += price;
          } else {
            order.remove('$title');
            _subtotal -= price;
          }
        });
      },
      activeColor: Colors.brown,
    );
  }
}
