import 'package:flutter/material.dart';

import 'client/MenusScreen.dart';
import 'client/OrdersScreen.dart';
import 'client/PaymentScreen.dart';
import 'client/SettingsScreen.dart';
import 'LoginScreen.dart';
import 'NewAccountScreen.dart';
import 'server/ServerMenusScreen.dart';
import 'server/ScannerScreen.dart';
import 'server/ServerOrdersScreen.dart';
import 'server/BillingInfoScreen.dart';
import 'server/QuantitiesOrderedScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'UofT Eats',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginScreen(title: 'Login'),

      // TODO: Add to tree structure for navigating screens as needed
      routes: <String, WidgetBuilder>{
        '/client/orders': (BuildContext context) => OrdersScreen(title: 'Orders'),
        '/client/payment': (BuildContext context) => PaymentScreen(title: 'Payment'),
        '/client/settings': (BuildContext context) =>
            SettingsScreen(title: 'Settings'),
        '/login': (BuildContext context) => LoginScreen(title: 'Login'),
        '/client/menus': (BuildContext context) => MenusScreen(title: 'Menus'),
        '/newAccount': (BuildContext context) => NewAccountScreen(title: 'New Account'),
        '/server/menus': (BuildContext context) => ServerMenusScreen(title: 'Menus'),
        '/server/scanner': (BuildContext context) => ScannerScreen(title: 'Scanner'),
        '/server/orders': (BuildContext context) => ServerOrdersScreen(title: 'Orders'),
        '/server/billingInfo': (BuildContext context) => BillingInfoScreen(title: 'Billing Info'),
        '/server/quantities': (BuildContext context) => QuantitiesOrderedScreen(title: 'Quantities'),
      },
    );
  }
}
