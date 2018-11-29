import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'clientGlobals.dart' as clientGlobals;
import 'clientReceipt.dart';

class PaymentConfirmationScreen extends StatelessWidget{
  PaymentConfirmationScreen({Key key, this.subtotal, this.order, this.truck})
    : super(key: key);

  final String truck;
  // TODO: my order format; I'd recommend modifying how you print to use this
  final Map order;
  // TODO: subtotal for ya Wilbert, feel free to pass this along as needed
  final double subtotal;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Payment Confirmation"),
        backgroundColor: Colors.blue,
      ),
      body: new PaymentConfirmation(order: order, subTotal: subtotal, truck: truck));
  }
}

class PaymentConfirmation extends StatelessWidget {
  PaymentConfirmation({Key key, this.order, this.subTotal, this.truck})
      : super(key: key);

  final String truck;
  final Map order;
  final double subTotal;

  List<List> myOrder;


  List<List> createOrder(Map myOrder){

    List<List> temp = [];
//    myOrder.forEach((key, value) => (){
//      temp.add(value);
//    });
    var keys = myOrder.keys.toList();
    for(int i = 0; i < myOrder.length; i++){
      temp.add(myOrder[keys[i]]);
    }

    return temp;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: new ListView(
          children: [
            //Header
            new PaymentConfirmationHeader(order: createOrder(order), subTotal: subTotal, truck: truck),
//            new OrderSummary(order: widget.order, tax: widget.tax)
            new OrderSummary(order: createOrder(order)),
            //Content
          ],
        )));
  }
}

class PaymentConfirmationHeader extends StatelessWidget {
  List order;
  double subTotal;

  PaymentConfirmationHeader({Key key, this.order, this.subTotal, this.truck})
    : super(key: key);

  final String truck;
  var headerHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Color.fromRGBO(192, 192, 192, 100.0),
      height: headerHeight,
      padding: EdgeInsets.only(top: 20.0),
      child: new Column(
        children: <Widget>[
          new Text("ORDER TOTAL",
            style:
            new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
          new Container(
            height: 5.0,
          ),
          new Text(
            "\$" + (subTotal * 1.13).toStringAsFixed(2),
            style: moneyTextStyle(),
          ),
          new Container(
            height: 10.0,
          ),
          new ConfirmButton(order: order, truck: truck),
          new Container(
            padding: EdgeInsets.only(left: 10.0),
            height: 30.0,
//            color: Colors.green,
            alignment: Alignment.bottomLeft,
          )
        ],
      ));
  }
}

class OrderSummary extends StatelessWidget {
  OrderSummary({Key key, this.order})
    : super(key: key);

  List order;

  ExpansionTile _newMenuItemTile() {
    return ExpansionTile(
      leading: Icon(
        Icons.fastfood,
      ),
      title: Text("Order Summary"),
      backgroundColor: Colors.white70,
      children: _generateItemTile(),
    );
  }

  List<Widget> _generateItemTile() {
    List<Widget> returnList = [];

    for (int i = 0; i < order.length; i++) {
      // Initialize 'order' with a key for every size + item combo
      // corresponding to a value representing quantity of combo in order

      if(order[i][0] > 0){
        returnList.add(new ListTile(
          trailing: new Row(
            children: <Widget>[
              new Text(order[i][1].toString()),
              Spacer(flex: 1),
              new Text(order[i][2].toString()),
              Spacer(flex: 1),
              new Text(order[i][0].toString()),
              Spacer(flex: 1),
              new Text('\$${(order[i][3] * order[i][0]).toStringAsFixed(2)}'),
              Spacer(flex: 1),
            ],
          ),
        ));
      }
    }
    return returnList;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(child: _newMenuItemTile());
  }
}

class ConfirmButton extends StatelessWidget {
  final List order;

  ConfirmButton({Key key, this.order, this.truck})
    : super(key: key);

  final String truck;

  @override
  Widget build(BuildContext context) {
    var button = Container(
        child: RaisedButton(
            child: Text("Place Order"),
            elevation: 5.0,
            color: Colors.green,
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => ClientReceipt(
//                    orderNum: 0,
//                    foodTruck: "Name",
//                    order: order,
//                    tax: 0.0
//                  )
//                )
//              );
//            }
            onPressed: (){confirmOrder(context, order, truck);},
            ));
    return button;
  }

// TODO: implement this alert + redirect to receipt page if wanted
void confirmOrder(BuildContext context, List orders, String truck) async {
    Firestore fs = Firestore.instance;
    String user = clientGlobals.user;

    List items = [];
    for (int i = 0; i < orders.length; i++) {
        if (orders[i][0] != 0) {
          Map map = {};
          map['type'] = orders[i][1];
          map['size'] = orders[i][2];
          map['quantity'] = orders[i][0];
          map['price'] = orders[i][3];
          items.add(map);
        }
    }

    QuerySnapshot query = await fs.collection('orders').getDocuments();
    List<DocumentSnapshot> docs = query.documents;

    int orderNum = 0;
    for (int i = 0; i < docs.length; i++) {
        if (docs[i]['orderNumber'] > orderNum) {
            orderNum = docs[i]['orderNumber'];
        }
    }

    String server = truck;

    fs.collection('orders').document()
        .setData({"client": user, "items": items, "orderNumber": orderNum + 1, "server": server, "status": 0});

    var alert = AlertDialog(
        title: Text("Order has been placed!"),
        content: Text("Order Number: 10234")
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
          return alert;
        }
    );

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ClientReceipt(
                orderNum: orderNum + 1,
                foodTruck: server,
                order: orders,
            )));
  }
}

TextStyle defaultTextStyle() {
  return TextStyle(fontSize: 20.0, decoration: TextDecoration.none);
}

TextStyle moneyTextStyle() {
  return TextStyle(
      fontSize: 50.0,
      color: Color.fromRGBO(0, 100, 0, 100.0),
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);
}
