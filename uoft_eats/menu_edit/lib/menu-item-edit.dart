import 'package:flutter/material.dart';

void main() => runApp(new MenuItemEdit());

class MenuItemEdit extends StatelessWidget {
  final String name;

  const MenuItemEdit({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Scaffold(
          appBar: AppBar(
            title: Text("Edit $name"),
          ),
          body: ItemEditable(name: name)
      ),
    );
  }
}

class ItemEditable extends StatelessWidget{
  final String name;

  const ItemEditable({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 60.0, 50.0, 50.0),
            child: new TextField(
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 32.0, color: Colors.black),
              decoration: InputDecoration(  hintText: '$name', ),
            ),
          ),
          new Container(
            height: 30.0,
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top:5.0, bottom: 5.0),
              child: new Text("Size",
                style: new TextStyle(color: Colors.black45, fontSize: 16.0)),
            ),
          )
        ]
    );
  }
}
