import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HoursOfOperationScreen extends StatefulWidget {

  _HoursOfOperationScreen createState() => new _HoursOfOperationScreen();

}

class _HoursOfOperationScreen extends State<HoursOfOperationScreen> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Hours of Operation")),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("servers").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState){
            case ConnectionState.waiting:
              return new Text('Loading....');
            default:
              return new Container(
                padding: new EdgeInsets.all(20.0),
                child: new ListView(
                  children: <Widget>[
                    new HoursOfOperationsTable(document: snapshot.data.documents),
                  ],
                )
              );
          }
        }
      )
    );
  }
}

DocumentSnapshot getFoodTruckDocument(List<DocumentSnapshot> documentList){

  DocumentSnapshot document;

//  documentList.map((DocumentSnapshot d){
//    if()
//  });
}

class HoursOfOperationsTable extends StatelessWidget{
  HoursOfOperationsTable({Key key, this.document}) : super(key: key);

  List<DocumentSnapshot> document;



  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new GenerateDays(),
              new GenerateOpeningTimes(),
              new GenerateHyphen(),
              new GenerateClosingTimes(),
            ],
          ),
          new Divider(color: Colors.grey),
          new Container(height: 15.0),
          new SaveButton()
        ],
      )
    );
  }
}

class GenerateDays extends StatelessWidget{
  final double rowSpacing = 10.0;
  final double columnWidth = 90.0;
  List<String> daysOfTheWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  List<Widget> dayWidgets = new List<Widget>();

  List<Widget> _getDays(List<String> days) {
    List<Widget> dayWidgets = new List<Widget>();
    for(String day in daysOfTheWeek) {
      dayWidgets.add(
        new Container(
          width: columnWidth,
          margin: new EdgeInsets.only(bottom: rowSpacing),
          child: new TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: day
            ),
          )
        )
      );
    }
    return dayWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _getDays(daysOfTheWeek)
      ),
      margin: new EdgeInsets.only(right: 60.0),
    );
  }
}

class GenerateOpeningTimes extends StatelessWidget{
  final double rowSpacing = 10.0;
  final double columnWidth = 50.0;
  List<String> openingTimes = [
    '8am',
    '8am',
    '8am',
    '8am',
    '9am',
    '10am',
    '10am'
  ];
  List<Widget> openingTimeWidgets = new List<Widget>();

  List<Widget> _getHours(List<String> hours) {
    List<Widget> hourWidgets = new List<Widget>();
    for(String hour in openingTimes) {
      hourWidgets.add(
        new Container(
          width: columnWidth,
          margin: new EdgeInsets.only(bottom: rowSpacing),
          child: new TextField(
            decoration: InputDecoration(
              hintText: hour
            ),
          )
        )
      );
    }
    return hourWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _getHours(openingTimes)
      ),
      margin: new EdgeInsets.only(right: 0.0, left: 0.0),
    );
  }
}

class GenerateHyphen extends StatelessWidget{
  final double rowSpacing = 10.0;
  final double columnWidth = 20.0;
  List<Widget> hyphenWidgets = new List<Widget>();

  List<Widget> _getHyphens() {
    List<Widget> hyphenWidgets = new List<Widget>();
    for(int i = 0; i < 7; i++) {
      hyphenWidgets.add(
        new Container(
          width: columnWidth,
          margin: new EdgeInsets.only(bottom: rowSpacing),
          child: new TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "-"
            ),
          )
        )
      );
    }
    return hyphenWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _getHyphens()
      ),
      margin: new EdgeInsets.only(right: 10.0, left: 20.0),
    );
  }
}

class GenerateClosingTimes extends StatelessWidget{
  final double rowSpacing = 10.0;
  final double columnWidth = 50.0;
  List<String> closingTimes = [
    '10pm',
    '10pm',
    '10pm',
    '10pm',
    '12am',
    '8pm',
    '5pm'
  ];
  List<Widget> closingTimeWidgets = new List<Widget>();

  List<Widget> _getHours(List<String> hours) {
    List<Widget> hourWidgets = new List<Widget>();
    for(String hour in closingTimes) {
      hourWidgets.add(
        new Container(
          width: columnWidth,
          margin: new EdgeInsets.only(bottom: rowSpacing),
          child: new TextField(
            decoration: InputDecoration(
              hintText: hour
            ),
          )
        )
      );
    }
    return hourWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _getHours(closingTimes)
      ),
      margin: new EdgeInsets.only(right: 0.0, left: 0.0),
    );
  }
}

class SaveButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var button = Container(
      child: RaisedButton(
        child: Text("Save"),
        elevation: 5.0,
        color: Colors.lightBlue,
        onPressed: (){
          save(context);
        }
      )
    );
    return button;
  }

  void save(BuildContext context){
    var alert = AlertDialog(
      title: Text("Success"),
      content: Text("You have successfully updated your hours of operations.")
    );
    showDialog(
      context: context,
      builder: (BuildContext context){
        return alert;
      }
    );
  }
}


TextStyle defaultTextStyle(){
  return TextStyle(
    fontSize: 20.0,
    decoration: TextDecoration.none
  );
}
