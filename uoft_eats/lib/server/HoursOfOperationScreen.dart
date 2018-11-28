import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uoft_eats/server/ServerDrawer.dart';
import 'package:uoft_eats/globals.dart' as globals;

List<TextEditingController> openingControllerList;
List<TextEditingController> closingControllerList;

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

  var monOpenController;
  var tuesOpenController;
  var wedOpenController;
  var thursOpenController;
  var friOpenController;
  var satOpenController;
  var sunOpenController;

  List<TextEditingController> populateControllerList(DocumentSnapshot document){

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

    List<TextEditingController> L = [];
    monOpenController = TextEditingController(text: openingTimes[0]);
    L.add(monOpenController);
    tuesOpenController = TextEditingController(text: openingTimes[1]);
    L.add(tuesOpenController);
    wedOpenController = TextEditingController(text: openingTimes[2]);
    L.add(wedOpenController);
    thursOpenController = TextEditingController(text: openingTimes[3]);
    L.add(thursOpenController);
    friOpenController = TextEditingController(text: openingTimes[4]);
    L.add(friOpenController);
    satOpenController = TextEditingController(text: openingTimes[5]);
    L.add(satOpenController);
    sunOpenController = TextEditingController(text: openingTimes[6]);
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
    List<TextEditingController> controllerList = populateControllerList(widget.document);
    openingControllerList = populateControllerList(widget.document);
    for(int i = 0; i < generateOpeningTimes(widget.document).length; i++) {
      hourWidgets.add(
        new Container(
          width: widget.columnWidth,
          margin: new EdgeInsets.only(bottom: widget.rowSpacing),
          child: new TextFormField(
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

  var monCloseController;
  var tuesCloseController;
  var wedCloseController;
  var thursCloseController;
  var friCloseController;
  var satCloseController;
  var sunCloseController;

  List<TextEditingController> populateControllerList(DocumentSnapshot document){

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

    List<TextEditingController> L = [];
    monCloseController = TextEditingController(text: closingTimes[0]);
    L.add(monCloseController);
    tuesCloseController = TextEditingController(text: closingTimes[1]);
    L.add(tuesCloseController);
    wedCloseController = TextEditingController(text: closingTimes[2]);
    L.add(wedCloseController);
    thursCloseController = TextEditingController(text: closingTimes[3]);
    L.add(thursCloseController);
    friCloseController = TextEditingController(text: closingTimes[4]);
    L.add(friCloseController);
    satCloseController = TextEditingController(text: closingTimes[5]);
    L.add(satCloseController);
    sunCloseController = TextEditingController(text: closingTimes[6]);
    L.add(sunCloseController);
    return L;
  }

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
    List<TextEditingController> controllerList = populateControllerList(widget.document);
    closingControllerList = populateControllerList(widget.document);
    for(int i = 0; i < generateClosingTimes(widget.document).length; i++) {
      hourWidgets.add(
        new Container(
          width: widget.columnWidth,
          margin: new EdgeInsets.only(bottom: widget.rowSpacing),
          child: new TextFormField(
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
        children: _getHours(generateClosingTimes(widget.document))
      ),
      margin: new EdgeInsets.only(right: 0.0, left: 0.0),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    monCloseController.dispose();
    tuesCloseController.dispose();
    wedCloseController.dispose();
    thursCloseController.dispose();
    friCloseController.dispose();
    satCloseController.dispose();
    sunCloseController.dispose();
    super.dispose();
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

  void updateDatabase(List<int> times) async{
    Firestore fs = Firestore.instance;
    QuerySnapshot query = await fs.collection("servers").getDocuments();
    List<DocumentSnapshot> documentList = query.documents;

    DocumentSnapshot thisDocument;

    String s = globals.user;
    for(int i = 0; i < documentList.length; i++){
      if(documentList[i]['name'] == s){
        thisDocument = documentList[i];
      }
    }

    thisDocument['hours'][0] = times[0];
    thisDocument['hours'][1] = times[1];
    thisDocument['hours'][2] = times[2];
    thisDocument['hours'][3] = times[3];
    thisDocument['hours'][4] = times[4];
    thisDocument['hours'][5] = times[5];
    thisDocument['hours'][6] = times[6];
    thisDocument['hours'][7] = times[7];
    thisDocument['hours'][8] = times[8];
    thisDocument['hours'][9] = times[9];
    thisDocument['hours'][10] = times[10];
    thisDocument['hours'][11] = times[11];
    thisDocument['hours'][12] = times[12];
    thisDocument['hours'][13] = times[13];
  }

  void save(BuildContext context){
    List<int> times = [];

    for(int i = 0; i < openingControllerList.length; i++){
      if(openingControllerList[i].text == "closed"){
        times.add(-1);
      }else{
        times.add(int.parse(openingControllerList[i].text));
      }
      if(closingControllerList[i].text == "closed"){
        times.add(-1);
      }else{
        times.add(int.parse(closingControllerList[i].text));
      }
    }

//    updateDatabase(times);

    var alert = AlertDialog(
      title: Text("Success"),
      content: Text(openingControllerList[2].text )
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
