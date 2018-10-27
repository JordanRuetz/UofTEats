import 'package:flutter/material.dart';

import 'MenusScreen.dart';
import 'OrdersScreen.dart';
import 'PaymentScreen.dart';
import 'SettingsScreen.dart';
import 'LoginScreen.dart';

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
        '/orders': (BuildContext context) => OrdersScreen(title: 'Orders'),
        '/payment': (BuildContext context) => PaymentScreen(title: 'Payment'),
        '/settings': (BuildContext context) =>
            SettingsScreen(title: 'Settings'),
        '/login': (BuildContext context) => LoginScreen(title: 'Login'),
        '/menus': (BuildContext context) => MenusScreen(title: 'Menus'),
      },
    );
  }
}
