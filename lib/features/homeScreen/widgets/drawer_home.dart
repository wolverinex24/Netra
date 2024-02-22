import 'package:flutter/material.dart';
import 'package:netra/features/languageselect/screens/lan_select.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Select Language'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LanSelect()));
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update UI based on the selected item
            },
          ),
          // Add more ListTiles for additional items in the drawer
        ],
      ),
    );
  }
}
