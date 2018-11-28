import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uoft_eats/server/ServerDrawer.dart';
import 'package:uoft_eats/globals.dart' as globals;

class HoursOfOperationScreen extends StatefulWidget {

  _HoursOfOperationScreen createState() => new _HoursOfOperationScreen();

}

class _HoursOfOperationScreen extends State<HoursOfOperationScreen>{

  Stream _stream;

  @override
  void initState() {
    // Only create the stream once
    _stream = Firestore.instance.collection("servers").snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Hours of Operation")),
      drawer: ServerDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
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


class HoursOfOperationsTable extends StatefulWidget{
  HoursOfOperationsTable({Key key, this.document}) : super(key: key);
  List<DocumentSnapshot> document;
  _HoursOfOperationsTable createState() => new _HoursOfOperationsTable();
}

class _HoursOfOperationsTable extends State<HoursOfOperationsTable>{

  DocumentSnapshot getFoodTruckDocument(List<DocumentSnapshot> documentList){
    DocumentSnapshot thisDocument;
    String s = globals.user;
    for(int i = 0; i < documentList.length; i++){
      if(documentList[i]['name'] == s){
        thisDocument = documentList[i];
      }
    }
    return thisDocument;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new GenerateDays(),
              new GenerateOpeningTimes(document: getFoodTruckDocument(widget.document)),
              new GenerateHyphen(),
              new GenerateClosingTimes(document: getFoodTruckDocument(widget.document)),
            ],
          ),
          new Divider(color: Colors.grey),
          new Container(height: 15.0),
          new SaveButton(),
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

class GenerateOpeningTimes extends StatefulWidget{

  GenerateOpeningTimes({Key key, this.document}) : super(key: key);
  DocumentSnapshot document;

  final double rowSpacing = 10.0;
  final double columnWidth = 50.0;

  _GenerateOpeningTimes createState() => new _GenerateOpeningTimes();
}

class _GenerateOpeningTimes extends State<GenerateOpeningTimes>{

  final monOpenController = TextEditingController();
  final tuesOpenController = TextEditingController();
  final wedOpenController = TextEditingController();
  final thursOpenController = TextEditingController();
  final friOpenController = TextEditingController();
  final satOpenController = TextEditingController();
  final sunOpenController = TextEditingController();

//  List<TextEditingController> controllerList = [];

  List<TextEditingController> populateControllerList(){
    List<TextEditingController> L = [];
    L.add(monOpenController);
    L.add(tuesOpenController);
    L.add(wedOpenController);
    L.add(thursOpenController);
    L.add(friOpenController);
    L.add(satOpenController);
    L.add(sunOpenController);
    return L;
  }

  List<String> generateOpeningTimes(DocumentSnapshot document){
    List<String> openingTimes = [];
    for(int i = 0; i < document['hours'].length; i++){
      if(i % 2 == 0) {
        if(document['hours'][i] == -1){
          openingTimes.add("closed");
        }else{
          openingTimes.add(document['hours'][i].toString());
        }
      }
    }
    return openingTimes;
  }

  List<Widget> openingTimeWidgets = new List<Widget>();

  List<Widget> _getHours(List<String> hours) {
    List<Widget> hourWidgets = new List<Widget>();
    List<TextEditingController> controllerList = populateControllerList();
    for(int i = 0; i < generateOpeningTimes(widget.document).length; i++) {
      hourWidgets.add(
        new Container(
          width: widget.columnWidth,
          margin: new EdgeInsets.only(bottom: widget.rowSpacing),
          child: new TextField(
//            initialValue: generateOpeningTimes(widget.document)[i],
//            decoration: InputDecoration(
//              border: InputBorder.none,
//              hintText: generateOpeningTimes(widget.document)[i]
//            ),
            controller: controllerList[i],
          ),
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
        children: _getHours(generateOpeningTimes(widget.document))
      ),
      margin: new EdgeInsets.only(right: 0.0, left: 0.0),
    );
  }


  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    monOpenController.dispose();
    tuesOpenController.dispose();
    wedOpenController.dispose();
    thursOpenController.dispose();
    friOpenController.dispose();
    satOpenController.dispose();
    sunOpenController.dispose();
    super.dispose();
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

class GenerateClosingTimes extends StatefulWidget{
  GenerateClosingTimes({Key key, this.document}) : super(key: key);
  DocumentSnapshot document;

  final double rowSpacing = 10.0;
  final double columnWidth = 50.0;

  _GenerateClosingTimes createState() => new _GenerateClosingTimes();
}

class _GenerateClosingTimes extends State<GenerateClosingTimes>{
  List<String> generateClosingTimes(DocumentSnapshot document){
    List<String> closingTimes = [];
    for(int i = 0; i < document['hours'].length; i++){
      if(i % 2 != 0) {
        if(document['hours'][i] == -1){
          closingTimes.add("closed");
        }else{
          closingTimes.add(document['hours'][i].toString());
        }
      }
    }
    return closingTimes;
  }

  List<Widget> closingTimeWidgets = new List<Widget>();

  List<Widget> _getHours(List<String> hours) {
    List<Widget> hourWidgets = new List<Widget>();
    for(String hour in generateClosingTimes(widget.document)) {
      hourWidgets.add(
        new Container(
          width: widget.columnWidth,
          margin: new EdgeInsets.only(bottom: widget.rowSpacing),
          child: new TextFormField(initialValue: hour),
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
        children: _getHours(generateClosingTimes(widget.document))
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
