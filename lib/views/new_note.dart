import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:notes/database/database_helpers.dart';

DatabaseHelpers _dbhelpers = DatabaseHelpers();
TextEditingController _newNote = TextEditingController();

class NewNote extends StatefulWidget {
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  @override
  void dispose() {
    _newNote.clear();
    super.dispose();
  }

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
          log('${_newNote.text}',
              name: 'com.theimpulson.notes: New Note Added');
          Navigator.pop(context);
        },
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
