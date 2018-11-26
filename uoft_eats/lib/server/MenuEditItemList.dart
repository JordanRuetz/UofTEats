import 'package:flutter/material.dart';
import 'package:uoft_eats/server/ServerDrawer.dart';
import 'MenuItemEdit.dart';


void main() => runApp(new MenuEditItemList());

class MenuEditItemList extends StatefulWidget {
  MenuEditItemList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuEditItemListState createState() => new _MenuEditItemListState();
}

class _MenuEditItemListState extends State<MenuEditItemList> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          drawer: new ServerDrawer(),
          appBar: AppBar(
            title: Text("Edit Menu"),
          ),
          body: ListView(
              children: [
                new EditableMenuItem(name: "Small Poutine", description: "Serves 1", price: 4.50),
                new EditableMenuItem(name: "Medium Poutine", description: "Serves 1-2", price: 5.50),
                new EditableMenuItem(name: "Large Poutine", description: "Serves 1-3", price: 6.50,),
              ]
          )
        );
  }
}

class EditableMenuItem extends StatelessWidget {
  final String name;
  final String description;
  final double price;

  const EditableMenuItem({Key key, this.name, this.description, this.price}) : super(key: key);

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
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>
                    (MenuItemEdit(name: name, description: description , price: price))),
                  );
                },
              ),
              trailing: Text("\$$price    ", style: TextStyle(fontSize: 16.0),),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}