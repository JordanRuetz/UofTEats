import 'package:flutter/material.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Payment Confirmation"),
          backgroundColor: Colors.brown,
        ),
        body: new PaymentConfirmation());
  }
}

class PaymentConfirmation extends StatelessWidget {
  final double tax = 0.91;
  final Map<String, List> singleOrder = {
    "Poutine": ["M", 1, 3.50],
    "Burger": ["S", 1, 2.50],
    "Drink": ["-", 1, 1.00],
  };

  @override
  Widget build(BuildContext context) {
    return new MyPaymentConfirmation(order: singleOrder, tax: tax);
  }
}

class MyPaymentConfirmation extends StatelessWidget {
  final Map<String, List> order;
  final double tax;

  MyPaymentConfirmation({Key key, this.order, this.tax}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
            child: new ListView(
      children: [
        //Header
        new PaymentConfirmationHeader(),
        new OrderSummary(order: order, tax: tax)
        //Content
      ],
    )));
  }
}

class PaymentConfirmationHeader extends StatelessWidget {
  var price = 7.91;
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
              "\$" + price.toString(),
              style: moneyTextStyle(),
            ),
            new Container(
              height: 10.0,
            ),
            new ConfirmButton(),
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
  final Map<String, List> order;
  final double tax;
  final double listSpacing = 8.0;
  double totalPrice = 0.0;

  OrderSummary({Key key, this.order, this.tax}) : super(key: key);

  List<Widget> _getItems(Map<String, List> order) {
    List<String> listOfItems = (order.keys).toList();
    List<Widget> orderWidgets = new List<Widget>();
    for (var i = 0; i < listOfItems.length; i++) {
      orderWidgets.add(new Container(
          width: 120.0,
          padding: new EdgeInsets.only(bottom: listSpacing),
          child: new Text(listOfItems[i])));
    }
    return orderWidgets;
  }

  // TODO: implement later
  /*List<Widget> _getSizes(Map<String, List> order) {
    List<String> listOfItems = (order.keys).toList();
    List<Widget> sizeWidgets = new List<Widget>();
    for (String item in listOfItems) {
      sizeWidgets.add(new Container(
        width: 60.0,
        padding: new EdgeInsets.only(bottom: listSpacing),
        child: new Text(order[item][0])));
    }
    return sizeWidgets;
  }*/

  // TODO: implement later
  /*List<Widget> _getQuantities(Map<String, List> order) {
    List<String> listOfItems = (order.keys).toList();
    List<Widget> quantityWidgets = new List<Widget>();
    for (String item in listOfItems) {
      String num = (order[item][1]).toString();
      quantityWidgets.add(new Container(
        width: 50.0,
        padding: new EdgeInsets.only(bottom: listSpacing),
        margin: new EdgeInsets.only(right: 20.0),
        child: new Text(num + "x")));
    }
    return quantityWidgets;
  }*/

  List<Widget> _getPrices(Map<String, List> order) {
    List<String> listOfItems = (order.keys).toList();
    List<Widget> priceWidgets = new List<Widget>();
    for (String item in listOfItems) {
      totalPrice += order[item][2];
      priceWidgets.add(new Container(
          padding: new EdgeInsets.only(bottom: listSpacing),
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
                    children: _getItems(order)),
                new Spacer(
                  flex: 1,
                ),
                /*new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _getSizes(order)),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _getQuantities(order)),*/
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getPrices(order)),
              ],
            ),
            new Divider(color: Colors.grey),
            new Container(
                height: 20.0,
                child: new Row(
                  children: <Widget>[
                    new Container(
                        width: 60.0,
                        padding: new EdgeInsets.only(bottom: listSpacing),
                        child: new Text("Subtotal",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0))),
                    new Spacer(
                      flex: 1,
                    ),
                    new Container(
                        padding: new EdgeInsets.only(bottom: listSpacing),
                        child: new Text(
                            ""
                                "\$" +
                                totalPrice.toStringAsFixed(2),
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0)))
                  ],
                )),
            new Container(
              height: listSpacing,
            ),
            new Container(
                height: 20.0,
                child: new Row(
                  children: <Widget>[
                    new Container(
                        width: 60.0,
                        padding: new EdgeInsets.only(bottom: listSpacing),
                        child: new Text("Taxes",
                            style: new TextStyle(fontSize: 15.0))),
                    new Spacer(
                      flex: 1,
                    ),
                    new Container(
                        padding: new EdgeInsets.only(bottom: listSpacing),
                        child: new Text("\$" + tax.toStringAsFixed(2)))
                  ],
                )),
            new Divider(color: Colors.grey),
            new Container(
                height: 20.0,
                child: new Row(
                  children: <Widget>[
                    new Container(
                        width: 60.0,
                        padding: new EdgeInsets.only(bottom: listSpacing),
                        child: new Text("Total",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0))),
                    new Spacer(
                      flex: 1,
                    ),
                    new Container(
                        padding: new EdgeInsets.only(bottom: listSpacing),
                        child: new Text(
                            "\$" + (totalPrice + tax).toStringAsFixed(2),
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0)))
                  ],
                )),
          ],
        ));
  }
}

class ConfirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
        child: RaisedButton(
            child: Text("Place Order"),
            elevation: 5.0,
            color: Colors.green,
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, '/client/paymentConfirmation/receipt');
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
