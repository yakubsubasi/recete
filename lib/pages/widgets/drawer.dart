import 'package:flutter/material.dart';

class AppDrawer extends Drawer {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Mustafa'),
            accountEmail: Text(''),
          ),
        ],
      ),
    );
  }
}
