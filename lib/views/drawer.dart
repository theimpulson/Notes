import 'package:flutter/material.dart';
import 'package:share/share.dart';

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
                Text('\tNotes version 1.0.0'),
                Container(
                  height: 50,
                  child: VerticalDivider(
                    indent: 5.0,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    return Share.share(
                        'Check out this simple and useful Notes app on Github\n\nhttps://github.com/theimpulson/Notes');
                  },
                )
              ],
            ),
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
              return showAboutDialog(
                context: context,
                applicationIcon: Image(
                  image: AssetImage('assets/icon.png'),
                ),
                applicationName: 'Notes',
                applicationVersion: 'version 1.0.0',
                applicationLegalese:
                    'Notes: A simple notes app written in Dart using Flutter framework\n\nCopyright (C) 2020  Aayush Gupta',
              );
            },
          )
        ],
      ),
    );
  }
}
