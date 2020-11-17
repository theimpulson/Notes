import 'package:flutter/material.dart';
import 'package:notes/database/database_helpers.dart';

DatabaseHelpers _dbhelpers = DatabaseHelpers();
TextEditingController _newNote = TextEditingController();

class NewNote extends StatelessWidget {
  const NewNote({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Use SafeArea to avoid overlapping with statusbar
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            controller: _newNote,
            decoration: InputDecoration(
              hintText: 'Note Something!....',
            ),
            keyboardType: TextInputType.multiline,
            maxLines: 100,
            autofocus: true,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        backgroundColor: Colors.amber,
        onPressed: () {
          _dbhelpers.insert(_newNote.text);
          print('${_newNote.text}');
          Navigator.pop(context);
        },
      ),
      resizeToAvoidBottomPadding: true,
    );
  }
}
