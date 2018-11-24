import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'NewAccountScreen.dart';
import 'SupportScreen.dart';

import 'client/MenusScreen.dart';
import 'client/OrdersScreen.dart';
import 'client/PaymentScreen.dart';
import 'client/SettingsScreen.dart';
import 'client/TemplateMenuScreen.dart';
import 'client/PaymentConfirmationScreen.dart';

import 'server/ServerMenusScreen.dart';
import 'server/ScannerScreen.dart';
import 'server/ServerOrdersScreen.dart';
import 'server/BillingInfoScreen.dart';
import 'server/QuantitiesOrderedScreen.dart';
import 'server/ServerOrderHistory.dart';
import 'server/MenuEditCategoryList.dart';
import 'server/MenuEditItemList.dart';
import 'server/HoursOfOperationScreen.dart';


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
        '/login': (BuildContext context) => LoginScreen(title: 'Login'),
        '/newAccount': (BuildContext context) => NewAccountScreen(title: 'New Account'),
        '/support': (BuildContext context) => SupportScreen(title: 'Support'),

        '/client/menus': (BuildContext context) => MenusScreen(title: 'Menus'),
        '/client/orders': (BuildContext context) => OrdersScreen(title: 'Orders'),
        '/client/payment': (BuildContext context) => PaymentScreen(title: 'Payment'),
        '/client/settings': (BuildContext context) => SettingsScreen(title: 'Settings'),
        '/client/menus/template': (BuildContext context) => TemplateMenuScreen(title: 'Template Menu'),
        '/server/paymentConfirmation': (BuildContext context) => PaymentConfirmationScreen(),

        '/server/menus': (BuildContext context) => ServerMenusScreen(title: 'Menus'),
        '/server/scanner': (BuildContext context) => ScannerScreen(title: 'Scanner'),
        '/server/orders': (BuildContext context) => ServerOrdersScreen(title: 'Orders'),
        '/server/billingInfo': (BuildContext context) => BillingInfoScreen(title: 'Billing Info'),
        '/server/quantities': (BuildContext context) => QuantitiesOrderedScreen(title: 'Quantities'),
        '/server/orderhistory': (BuildContext context) => ServerOrderHistory(title: 'Order History'),
        '/server/editmenucategorylist': (BuildContext context) => MenuEditCategoryList(title: 'Edit Menu Category'),
        '/server/editmenuitemlist': (BuildContext context) => MenuEditItemList(title: 'Edit Menu Items',),
        '/server/editHoursOfOperation': (BuildContext context) => HoursOfOperationScreen(),
      },
    );
  }
}
