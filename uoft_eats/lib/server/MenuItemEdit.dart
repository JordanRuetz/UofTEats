import 'package:flutter/material.dart';
import 'package:uoft_eats/server/ServerDrawer.dart';

void main() => runApp(new MenuItemEdit());

class MenuItemEdit extends StatefulWidget {
  MenuItemEdit({Key key, this.title, this.name, this.price}) : super(key: key);
  final String name;
  final double price;
  final String title;

  @override
  _MenuItemEdit createState() => new _MenuItemEdit();
}

class _MenuItemEdit extends State<MenuItemEdit> {
  @override
  Widget build(BuildContext context) {
    return new ItemEditablesPage(
      name: widget.name,
      price: widget.price,
    );
  }
}

class ItemEditablesPage extends StatefulWidget {
  final String name;
  final double price;

  const ItemEditablesPage({Key key, this.name, this.price}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ItemEditables();
  }
}

class ItemEditables extends State<ItemEditablesPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new ServerDrawer(),
      appBar: AppBar(
        title: Text("Edit menu"),
      ),
      body: new Container(
          padding: const EdgeInsets.all(38.0),
          child: new Column(
            children: <Widget>[
              new TextFormField(
                initialValue: widget.name,
                decoration: new InputDecoration(
                  labelText: "Enter your new name",
                ),
                keyboardType: TextInputType.text,
              ),
              new TextFormField(
                initialValue: widget.price.toString(),
                decoration: new InputDecoration(
                  labelText: "Enter your new price",
                ),
                keyboardType: TextInputType.number,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                      onPressed: () {
                        // Navigator.of(context).pop(true);
                      },
                      child: Text("Confirm")),
                ],
              )
            ],
          )),
    );
  }
}
