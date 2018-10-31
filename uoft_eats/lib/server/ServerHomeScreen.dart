import 'package:flutter/material.dart';

import 'package:uoft_eats/server/ServerDrawer.dart';

class ServerHomeScreen extends StatefulWidget {
  ServerHomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyServerHomeScreenState createState() => new _MyServerHomeScreenState();
}

class _MyServerHomeScreenState extends State<ServerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Welcome"), // widget.title
        ),
        drawer: ServerDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome, ",
                  style: new TextStyle(fontSize: 38.0, color: Colors.black45),
                ),
                Text("Ideal Catering",
                    style: new TextStyle(
                        fontSize: 48.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w200)),
                new Row(children: [
                  Text("You currently have ",
                      style:
                          new TextStyle(fontSize: 20.0, color: Colors.black45)),
                  FlatButton(
                    child: Text("12 orders",
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.black45)),
                    onPressed: () {},
                  )
                ]),
                new Row(children: [
                  Text("Today's revenue ",
                      style:
                          new TextStyle(fontSize: 20.0, color: Colors.black45)),
                  FlatButton(
                    child: Text("\$ 2207.50",
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.black45)),
                    onPressed: () {},
                  )
                ]),
                Divider(
                  color: Colors.black,
                ),
                Center(
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                        child: Text("Your hours today are: ",
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.black87)),
                      ),
                      Text("9:00\n-\n7:00",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontSize: 48.0,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ]),
        ));
  }
}
