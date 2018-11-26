import 'package:flutter/material.dart';

class ServerDrawer extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                    DrawerHeader(
                        child: Icon(Icons.fastfood),
                        decoration: BoxDecoration(
                            color: Colors.red,
                        ),
                    ),
                    ListTile(
                        leading: const Icon(Icons.add_shopping_cart),
                        title: Text('Menus'),
                        onTap: () {
                            Navigator.pop(context); // Closes the drawer before moving
                            Navigator.pushReplacementNamed(context, '/server/menus');
                        },
                    ),
                    ListTile(
                        leading: const Icon(Icons.history),
                        title: Text('Pending Orders'),
                        onTap: () {
                            Navigator.pop(context); // Closes the drawer before moving
                            Navigator.pushReplacementNamed(context, '/server/orders');
                        },
                    ),
                    ListTile(
                        leading: const Icon(Icons.history),
                        title: Text('Quantities'),
                        onTap: () {
                            Navigator.pop(context); // Closes the drawer before moving
                            Navigator.pushReplacementNamed(context, '/server/quantities');
                        },
                    ),
                    ListTile(
                        leading: const Icon(Icons.history),
                        title: Text('Scanner'),
                        onTap: () {
                            Navigator.pop(context); // Closes the drawer before moving
                            Navigator.pushReplacementNamed(context, '/server/scanner');
                        },
                    ),
                    ListTile(
                        leading: const Icon(Icons.attach_money),
                        title: Text('Billing Info'),
                        onTap: () {
                            Navigator.pop(context); // Closes the drawer before moving
                            Navigator.pushReplacementNamed(context, '/server/billingInfo');
                        },
                    ),
                ],
            ));
    }
}