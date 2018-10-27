import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
    final String title;

    LoginScreen({Key key, this.title}) : super(key: key);

    @override
    _MyLoginScreenState createState() => new _MyLoginScreenState();
}

class _MyLoginScreenState extends State<LoginScreen> {
    final TextEditingController _textController = new TextEditingController();

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            body: new Center(
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        new Spacer(flex: 3),
                        new Container(
                            child: new Text(
                                'U of T Eats',
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                ),
                            )
                        ),
                        new Spacer(flex: 1),
                        new Container(
                            margin: new EdgeInsets.all(10.0),
                            child: new Text(
                                'Username:'
                            ),
                        ),
                        new Container(
                            margin: new EdgeInsets.all(10.0),
                            width: 200.0,
                            child: new TextField(
                                decoration: InputDecoration(
                                    hintText: "Send a message"),
                            ),
                        ),
                        new Container(
                            margin: new EdgeInsets.all(10.0),
                            child: new Text('Password:'),
                        ),
                        new Container(
                            margin: new EdgeInsets.all(10.0),
                            width: 200.0,
                            child: new TextField(
                                decoration: InputDecoration(
                                    hintText: "Send a message"),
                            )
                        ),
                        new RaisedButton(
                            onPressed: _login,
                            child: new Text('Login')
                        ),
                        new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget> [
                                new Container(
                                    margin: new EdgeInsets.all(5.0),
                                    child: new RaisedButton(
                                        onPressed: _createAccount,
                                        child: new Text(
                                            'Create Account'
                                        ),
                                    ),
                                ),
                                new Container(
                                    margin: new EdgeInsets.all(5.0),
                                    child: new RaisedButton(
                                        onPressed: _support,
                                        child: new Text(
                                            'Support'
                                        ),
                                    ),
                                ),


                            ]
                        ),
                        new Spacer(flex: 3),
                    ],
                ),
            ),
        );
    }

    void _login() {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, '/menus');
    }

    void _support() {

    }

    void _createAccount() {

    }
}
