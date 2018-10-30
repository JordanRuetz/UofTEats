import 'package:flutter/material.dart';

void main() => runApp(new MenuCategoryEdit());

class MenuCategoryEdit extends StatelessWidget {
  final String name;

  const MenuCategoryEdit({Key key, this.name}) : super(key: key);

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
          body: CategoryEditable()
      ),
    );
  }
}

class CategoryEditable extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new ListView(
        children: [
        ]
    );
  }
}
