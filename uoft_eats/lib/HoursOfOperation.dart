import 'package:flutter/material.dart';

class HoursOfOperation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text("Hours of Operation")),
      body: Material(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            margin: EdgeInsets.only(top: 50.0),
//        width: 150.0,
//        height: 100.0,
            child: Column(
              children: <Widget>[
                //Hours of Operation
                Table(
                  columnWidths: {
                    0: FixedColumnWidth(150.0),
                    1: FixedColumnWidth(70.0),
                    2: FixedColumnWidth(30.0),
                    3: FixedColumnWidth(70.0),
                  },
                  children: [
                    TableRow(
                      children: [
                        Container(alignment: Alignment.centerLeft, child: Text("Monday", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("8am", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("-", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("10pm", style: defaultTextStyle()),)
                      ]
                    ),
                    TableRow(
                      children: [
                        Container(alignment: Alignment.centerLeft, child: Text("Tuesday", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("8am", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("-", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("10pm", style: defaultTextStyle()),)
                      ]
                    ),
                    TableRow(
                      children: [
                        Container(alignment: Alignment.centerLeft, child: Text("Wednesday", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("8am", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("-", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("10pm", style: defaultTextStyle()),)
                      ]
                    ),
                    TableRow(
                      children: [
                        Container(alignment: Alignment.centerLeft, child: Text("Thursday", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("8am", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("-", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("10pm", style: defaultTextStyle()),)
                      ]
                    ),
                    TableRow(
                      children: [
                        Container(alignment: Alignment.centerLeft, child: Text("Friday", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("10am", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("-", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("12am", style: defaultTextStyle()),)
                      ]
                    ),
                    TableRow(
                      children: [
                        Container(alignment: Alignment.centerLeft, child: Text("Saturday", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("9am", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("-", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("8pm", style: defaultTextStyle()),)
                      ]
                    ),
                    TableRow(
                      children: [
                        Container(alignment: Alignment.centerLeft, child: Text("Sunday", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("9am", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("-", style: defaultTextStyle()),),
                        Container(alignment: Alignment.center, child: Text("5pm", style: defaultTextStyle()),)
                      ]
                    ),
                  ],
                ),
                // Save Button
                RaisedButton(
                  child: Text("Save"),
                  elevation: 5.0,
                  color: Colors.lightBlue,
                  onPressed: (){
                    save(context);
                  },
                )
              ],
            )
          )
        )
      )
    );
  }

  TextStyle defaultTextStyle(){
    return TextStyle(
      fontSize: 20.0,
      decoration: TextDecoration.none
    );
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
