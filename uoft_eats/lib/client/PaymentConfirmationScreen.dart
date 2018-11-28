import 'package:flutter/material.dart';
import 'package:uoft_eats/client/ClientReceipt.dart';

class PaymentConfirmationScreen extends StatefulWidget{
  PaymentConfirmationScreen({Key key, this.subtotal, this.order})
    : super(key: key);

  // TODO: my order format; I'd recommend modifying how you print to use this
  final Map order;
  // TODO: subtotal for ya Wilbert, feel free to pass this along as needed
  final double subtotal;

  @override
  _MyPaymentConfirmationScreen createState() => new _MyPaymentConfirmationScreen();
}

class _MyPaymentConfirmationScreen extends State<PaymentConfirmationScreen>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Payment Confirmation"),
          backgroundColor: Colors.blue,
        ),
        body: new PaymentConfirmation(order: widget.order));
  }
}

class PaymentConfirmation extends StatefulWidget {
  PaymentConfirmation({Key key, this.order})
      : super(key: key);

  final Map order;
  final double tax = 0.0;
//  final Map<String, List> singleOrder = {
//    "Poutine": ["M", 1, 3.50],
//    "Burger": ["S", 1, 2.50],
//    "Drink": ["-", 1, 1.00],
//  };
  var singleOrder = <String, List>{};

  Map<String, List> createOrder(Map myOrder){
    var answer = <String, List>{};

    for(int i = 0; i < myOrder.length; i++){
      answer[myOrder[i][1].toString()] = [myOrder[i][2].toString(), int.parse(myOrder[i][0]), double.parse(myOrder[i][3])];
    }
    singleOrder = answer;
    return answer;
  }

  @override
  _PaymentConfirmation createState() => new _PaymentConfirmation();
}

class _PaymentConfirmation extends State<PaymentConfirmation>{
  @override
  Widget build(BuildContext context) {
    return new MyPaymentConfirmation(order: widget.singleOrder, tax: widget.tax);
  }
}

class MyPaymentConfirmation extends StatefulWidget {
  MyPaymentConfirmation({Key key, this.order, this.tax})
    : super(key: key);

  //  final Map<String, List> order;
  Map<String, List> order;
  final double tax;

  _MyPaymentConfirmation createState() => new _MyPaymentConfirmation();
}

class _MyPaymentConfirmation extends State<MyPaymentConfirmation>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: new ListView(
          children: [
            //Header
            new PaymentConfirmationHeader(order: widget.order),
            new OrderSummary(order: widget.order, tax: widget.tax)
            //Content
          ],
        )));
  }
}

class PaymentConfirmationHeader extends StatefulWidget {
  final Map<String, List> order;

  PaymentConfirmationHeader({Key key, this.order})
    : super(key: key);

  var price = 7.91;
  var headerHeight = 200.0;

  _PaymentConfirmationHeader createState() => new _PaymentConfirmationHeader();
}

class _PaymentConfirmationHeader extends State<PaymentConfirmationHeader>{
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Color.fromRGBO(192, 192, 192, 100.0),
      height: widget.headerHeight,
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
            "\$" + widget.price.toString(),
            style: moneyTextStyle(),
          ),
          new Container(
            height: 10.0,
          ),
          new ConfirmButton(order: widget.order),
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

class OrderSummary extends StatefulWidget {
  OrderSummary({Key key, this.order, this.tax}) : super(key: key);

  final Map<String, List> order;
  final double tax;
  final double listSpacing = 8.0;
  double totalPrice = 0.0;

  _OrderSummary createState() => new _OrderSummary();
}

class _OrderSummary extends State<OrderSummary>{
  List<Widget> _getItems(Map<String, List> order) {
    List<String> listOfItems = (order.keys).toList();
    List<Widget> orderWidgets = new List<Widget>();
    for (var i = 0; i < listOfItems.length; i++) {
      orderWidgets.add(new Container(
        width: 120.0,
        padding: new EdgeInsets.only(bottom: widget.listSpacing),
        child: new Text(listOfItems[i])));
    }
    return orderWidgets;
  }

  List<Widget> _getSizes(Map<String, List> order) {
    List<String> listOfItems = (order.keys).toList();
    List<Widget> sizeWidgets = new List<Widget>();
    for (String item in listOfItems) {
      sizeWidgets.add(new Container(
        width: 60.0,
        padding: new EdgeInsets.only(bottom: widget.listSpacing),
        child: new Text(order[item][0])));
    }
    return sizeWidgets;
  }

  List<Widget> _getQuantities(Map<String, List> order) {
    List<String> listOfItems = (order.keys).toList();
    List<Widget> quantityWidgets = new List<Widget>();
    for (String item in listOfItems) {
      String num = (order[item][1]).toString();
      quantityWidgets.add(new Container(
        width: 50.0,
        padding: new EdgeInsets.only(bottom: widget.listSpacing),
        margin: new EdgeInsets.only(right: 20.0),
        child: new Text(num + "x")));
    }
    return quantityWidgets;
  }

  List<Widget> _getPrices(Map<String, List> order) {
    List<String> listOfItems = (order.keys).toList();
    List<Widget> priceWidgets = new List<Widget>();
    for (String item in listOfItems) {
      widget.totalPrice += order[item][2];
      priceWidgets.add(new Container(
        padding: new EdgeInsets.only(bottom: widget.listSpacing),
        child: new Text("\$" + (order[item][2]).toStringAsFixed(2))));
    }
    return priceWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(30.0),
      margin: new EdgeInsets.only(right: 20.0),
      child: new Column(
        children: <Widget>[
          new Text("Order Summary",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
          new Row(
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _getItems(widget.order)),
              new Spacer(
                flex: 1,
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _getSizes(widget.order)),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _getQuantities(widget.order)),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _getPrices(widget.order)),
            ],
          ),
          new Divider(color: Colors.grey),
          new Container(
            height: 20.0,
            child: new Row(
              children: <Widget>[
                new Container(
                  width: 60.0,
                  padding: new EdgeInsets.only(bottom: widget.listSpacing),
                  child: new Text("Subtotal",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15.0))),
                new Spacer(
                  flex: 1,
                ),
                new Container(
                  padding: new EdgeInsets.only(bottom: widget.listSpacing),
                  child: new Text(
                    ""
                      "\$" +
                      widget.totalPrice.toStringAsFixed(2),
                    style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15.0)))
              ],
            )),
          new Container(
            height: widget.listSpacing,
          ),
          new Container(
            height: 20.0,
            child: new Row(
              children: <Widget>[
                new Container(
                  width: 60.0,
                  padding: new EdgeInsets.only(bottom: widget.listSpacing),
                  child: new Text("Taxes",
                    style: new TextStyle(fontSize: 15.0))),
                new Spacer(
                  flex: 1,
                ),
                new Container(
                  padding: new EdgeInsets.only(bottom: widget.listSpacing),
                  child: new Text("\$" + widget.tax.toStringAsFixed(2)))
              ],
            )),
          new Divider(color: Colors.grey),
          new Container(
            height: 20.0,
            child: new Row(
              children: <Widget>[
                new Container(
                  width: 60.0,
                  padding: new EdgeInsets.only(bottom: widget.listSpacing),
                  child: new Text("Total",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15.0))),
                new Spacer(
                  flex: 1,
                ),
                new Container(
                  padding: new EdgeInsets.only(bottom: widget.listSpacing),
                  child: new Text(
                    "\$" + (widget.totalPrice + widget.tax).toStringAsFixed(2),
                    style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15.0)))
              ],
            )),
        ],
      ));
  }
}

class ConfirmButton extends StatelessWidget {
  final Map<String, List> order;

  ConfirmButton({Key key, this.order})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = Container(
        child: RaisedButton(
            child: Text("Place Order"),
            elevation: 5.0,
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClientReceipt(
                    orderNum: 0,
                    foodTruck: "Name",
                    order: order,
                    tax: 0.0
                  )
                )
              );
            }));
    return button;
  }

// TODO: implement this alert + redirect to receipt page if wanted
/*void confirmOrder(BuildContext context){
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
  }*/
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
