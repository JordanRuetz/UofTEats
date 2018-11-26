import 'package:flutter/material.dart';

import 'package:uoft_eats/client/MainDrawer.dart';

class MenusScreen extends StatefulWidget {
  MenusScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyMenusScreenState createState() => new _MyMenusScreenState();
}

class _MyMenusScreenState extends State<MenusScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              color: Colors.brown,
            ),
            title: const Text('Ideal Catering'),
            subtitle: const Text('Open 24/7'),
            onTap: () {
              Navigator.pushNamed(context, '/client/menus/template');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              color: Colors.red,
            ),
            title: const Text('Inferior Food Truck 1'),
            subtitle: const Text('Open 8 AM - 6 PM'),
            onTap: () {
              Navigator.pushNamed(context, '/client/menus/template');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              color: Colors.blue,
            ),
            title: const Text('Inferior Food Truck 2'),
            subtitle: const Text('Open 8 AM - 6 PM'),
            onTap: () {
              Navigator.pushNamed(context, '/client/menus/template');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              color: Colors.green,
            ),
            title: const Text('Inferior Food Truck 3'),
            subtitle: const Text('Open 8 AM - 6 PM'),
            onTap: () {
              Navigator.pushNamed(context, '/client/menus/template');
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
