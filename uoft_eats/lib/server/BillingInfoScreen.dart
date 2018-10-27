import 'package:flutter/material.dart';

import 'package:uoft_eats/server/ServerDrawer.dart';

class BillingInfoScreen extends StatefulWidget {
    BillingInfoScreen({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MyBillingInfoScreenState createState() => new _MyBillingInfoScreenState();
}

class _MyBillingInfoScreenState extends State<BillingInfoScreen> {
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            drawer: new ServerDrawer(),
            appBar: new AppBar(
                title: new Text(widget.title),
            ),
            body: new Center(
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        new Spacer(flex: 5),
                        new Container(
                            child: new Text(
                                'Paypal Account Email:',
                                style: TextStyle(
                                    fontSize: 25.0,
                                ),
                            ),
                        ),
                        new Container(
                            margin: new EdgeInsets.all(10.0),
                            child: new Text('N/A'),
                        ),
                        new Spacer(flex: 2),
                        new Container(
                            child: new Text(
                                'Change PayPal Account',
                                style: TextStyle(
                                    fontSize: 25.0,
                                ),
                            ),
                        ),
                        new Container(
                            margin: new EdgeInsets.only(top: 10.0),
                            child: new Text('Email Address for new Paypal Account:'),
                        ),
                        new Container(
                            width: 200.0,
                            child: new TextField(),
                        ),
                        new Container(
                            margin: new EdgeInsets.all(10.0),
                            child: new RaisedButton(
                                onPressed: _validateAccount,
                                child: new Text('Change Account'),
                            ),
                        ),
                        new Spacer(flex: 5)
                    ],
                ),
            ),
        );
    }

    void _validateAccount() {

    }
}