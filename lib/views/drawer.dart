import 'package:flutter/material.dart';

class LocalDrawer extends StatelessWidget {
  const LocalDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/icon.png'),
                ),
                Text('\tNotes'),
              ],
            ),
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              return showAboutDialog(
                context: context,
                applicationIcon: Image(
                  image: AssetImage('assets/icon.png'),
                ),
                applicationName: 'Notes',
                applicationVersion: 'version 1.0.0',
                applicationLegalese:
                    'Notes: A simple notes app written in dart using flutter framework\n\nCopyright (C) 2020  Aayush Gupta',
              );
            },
          )
        ],
      ),
    );
  }
}
