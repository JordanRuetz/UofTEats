import 'package:flutter/material.dart';
import 'menu_item_list_edit.dart';
import 'menu-category-edit.dart';


void main() => runApp(new MenuEdit());

class MenuEdit extends StatelessWidget {
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
        new EditableMenuItem(name: "Poutine", description: "Freshly cut fries with gravy",),
        new EditableMenuItem(name: "Hot dog", description: "Classic hot dog with condiments available at pickup",),
        new EditableMenuItem(name: "Entrée", description: "<no description>",),
        new EditableMenuItem(name: "Burgers", description: "<no description>",),
        new EditableMenuItem(name: "Drinks", description: "Pop drinks",),
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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MenuItemListEdit()));
              },
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text("$name",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
              ),
              subtitle: Text("$description", style: TextStyle(fontStyle: FontStyle.italic),),
              leading: IconButton(
                icon: Icon( Icons.edit, ),
                tooltip: 'Edit this item',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuCategoryEdit(name: name)),
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