import 'package:flutter/material.dart';
import 'menu-item-edit.dart';


void main() => runApp(new MenuItemListEdit());

class MenuItemListEdit extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Scaffold(
          appBar: AppBar(
            title: Text("Edit menu"),
          ),
          body: CatagoryItems()
        ),
    );
  }
}

class CatagoryItems extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: [
        new EditableMenuItem(name: "Small Poutine", description: "Frenshly cut french fries with gravy, serves 1",),
        new EditableMenuItem(name: "Medium Poutine", description: "Frenshly cut french fries with gravy, serves 1-2",),
        new EditableMenuItem(name: "Large Poutine", description: "Frenshly cut french fries with gravy, serves 1-3",),
      ]
    );
  }
}

class EditableMenuItem extends StatelessWidget {
  final String name;
  final String description;

  const EditableMenuItem({Key key, this.name, this.description}) : super(key: key);

  Widget build(BuildContext context) {
    return new Container(
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text("$name",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
              ),
              subtitle: Text("$description"),
              leading: IconButton(
                icon: Icon( Icons.edit, ),
                tooltip: 'Edit this item',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (MenuItemEdit(name: name))),
                  );
                },
              )
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}