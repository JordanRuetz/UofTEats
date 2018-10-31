import 'package:flutter/material.dart';

import 'package:uoft_eats/server/ServerDrawer.dart';
import 'MenuQuantityItem.dart';

class QuantitiesOrderedScreen extends StatefulWidget {
    QuantitiesOrderedScreen({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MyQuantitiesOrderedScreenState createState() => new _MyQuantitiesOrderedScreenState();
}

class _MyQuantitiesOrderedScreenState extends State<QuantitiesOrderedScreen> {
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            drawer: new ServerDrawer(),
            appBar: new AppBar(
                title: new Text(widget.title),
            ),
            body: new ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                    return new MenuQuantityItem();
                },
            ),
        );
    }
}