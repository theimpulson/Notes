import 'package:flutter/material.dart';
import 'package:share/share.dart';

class LocalDrawer extends StatelessWidget {
  const LocalDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String app_name = 'Notes';
    String app_version = 'version 1.1.0';
    String app_icon = 'assets/icon.png';

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage(app_icon),
                ),
                Text('\t$app_name $app_version'),
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
                  image: AssetImage(app_icon),
                ),
                applicationName: app_name,
                applicationVersion: app_version,
                applicationLegalese:
                    'Notes: A simple notes app written in Dart using Flutter framework\n\nCopyright (C) 2020  Aayush Gupta',
              );
            },
          ),
          ListTile(
            title: Text('Help'),
            onTap: () {
              Navigator.pop(context);
              return Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text(
                    'Click on the + button to add a Note. Swipe to delete it.',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
