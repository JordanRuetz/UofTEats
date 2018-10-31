import 'package:flutter/material.dart';

void main() => runApp(new MenuCategoryEdit());

class MenuCategoryEdit extends StatelessWidget {
  final String name;
  final String description;

  const MenuCategoryEdit(
      {Key key, this.name, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new CategoryEditablesPage(
        name: name, description: description,),
      theme: new ThemeData(primarySwatch: Colors.green),
    );
  }
}

class CategoryEditablesPage extends StatefulWidget {
  final String name;
  final String description;

  const CategoryEditablesPage(
      {Key key, this.name, this.description}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new CategoryEditables();
  }
}

class CategoryEditables extends State<CategoryEditablesPage> {
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
