import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewAccountScreen extends StatefulWidget {
  final String title;

  NewAccountScreen({Key key, this.title}) : super(key: key);

  @override
  _MyNewAccountScreenState createState() => new _MyNewAccountScreenState();
}

class _MyNewAccountScreenState extends State<NewAccountScreen> {
  String dropdownValue = 'Student';

  final userController = TextEditingController();
  String userHint = "";
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

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
              'Create Account',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            )),
            new Spacer(flex: 1),
            new Container(
              margin: new EdgeInsets.only(top: 10.0),
              child: new Text('Username:'),
            ),
            new Container(
              margin: new EdgeInsets.only(bottom: 10.0),
              width: 200.0,
              child: new TextField(
                decoration: InputDecoration(
                    hintText: userHint,
                ),
                controller: userController,
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(top: 10.0),
              child: new Text('Password:'),
            ),
            new Container(
                margin: new EdgeInsets.only(bottom: 10.0),
                width: 200.0,
                child: new TextField(controller: passController,)),
            new Container(
              margin: new EdgeInsets.only(top: 10.0),
              child: new Text('Repeat Password:'),
            ),
            new Container(
                margin: new EdgeInsets.only(bottom: 10.0),
                width: 200.0,
                child: new TextField(controller: confirmPassController,)),
            new Container(
                margin: new EdgeInsets.all(5.0),
                height: 50.0,
                child: new DropdownButton<String>(
                    value: dropdownValue,
                    items:
                        <String>['Student', 'Food Truck'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (String _value) {
                      setState(() {
                        dropdownValue = _value;
                      });
                    })),
            new RaisedButton(
                onPressed: createAccount, child: new Text('Create Account')),
            new Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  void createAccount() {
    String user = userController.text;
    String pass = Text(passController.text).data;
    String confirmPass = Text(confirmPassController.text).data;


    if (user == '') {
      print("confirmed");
      userHint = "can't be empty";
    } else if (false) {

    } else {
      if (dropdownValue == 'Student') {
        Navigator.pushReplacementNamed(context, '/client/menus');
      } else {
        Navigator.pushReplacementNamed(context, '/server/menus');
      }
    }

    Firestore fs = Firestore.instance;
    fs.collection("accounts").snapshots().listen((data) => (
        data.documents.forEach((doc) => (print(doc.data['testVal'])))
    ));


  }

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }


}
