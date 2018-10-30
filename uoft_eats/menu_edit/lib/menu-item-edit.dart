import 'package:flutter/material.dart';

void main() => runApp(new MenuItemEdit());

class MenuItemEdit extends StatelessWidget {
  final String name;
  final String description;
  final double price;

  const MenuItemEdit(
      {Key key, this.name, this.description, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ItemEditablesPage(
          name: name, description: description, price: price,),
      theme: new ThemeData(primarySwatch: Colors.green),
    );
  }
}

class ItemEditablesPage extends StatefulWidget {
  final String name;
  final String description;
  final double price;

  const ItemEditablesPage(
      {Key key, this.name, this.description, this.price}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ItemEditables();
  }
}

class ItemEditables extends State<ItemEditablesPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                    labelText: "Enter your new name",),
                keyboardType: TextInputType.text,
              ),
              new TextFormField(
                initialValue: widget.price.toString(),
                decoration: new InputDecoration(
                    labelText: "Enter your new price",),
                keyboardType: TextInputType.number,
              ),
              new TextFormField(
                maxLength: 40,
                initialValue: widget.description,
                decoration: new InputDecoration(
                  labelText: "Enter your new description",),
                keyboardType: TextInputType.text,
              ),
              new Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  new RaisedButton(
                    onPressed: () {
  //                  this doesn't seem to work... why?
  //                  Navigator.of(context).pop(true);
                    }, child: Text("Confirm")
                  ),
                  new RaisedButton(
                      onPressed: () {
  //                  this doesn't seem to work... why?
  //                  Navigator.of(context).pop(true);
                      }, child: Text("Cancel")
                  ),
                ],
              )
            ],
          )),
    );
  }
}
