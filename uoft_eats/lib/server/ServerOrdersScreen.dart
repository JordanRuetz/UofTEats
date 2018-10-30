import 'package:flutter/material.dart';

import 'package:uoft_eats/server/ServerDrawer.dart';

class ServerOrdersScreen extends StatefulWidget {
    ServerOrdersScreen({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MyServerOrdersScreenState createState() => new _MyServerOrdersScreenState();
}

class _MyServerOrdersScreenState extends State<ServerOrdersScreen> {
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            drawer: new ServerDrawer(),
            appBar: new AppBar(
                title: new Text(widget.title),
            ),
            body: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                        new Text(
                            'PLACEHOLDER',
                        ),
                    ],
                ),
            ),
        );
    }
}