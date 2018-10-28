import 'package:flutter/material.dart';


class MenuQuantityItem extends StatefulWidget {
    MenuQuantityItem({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MyMenuQuantityItemState createState() => new _MyMenuQuantityItemState();
}

class _MyMenuQuantityItemState extends State<MenuQuantityItem> {
    @override
    Widget build(BuildContext context) {
        return new ListTile(
            title: new Text("Item"),
            trailing: new Text(
                "Number",
                style: TextStyle(
                    fontSize: 20.0,
                ),
            ),
        );
    }
}
