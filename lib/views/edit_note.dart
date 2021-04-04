import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:notes/database/database_helpers.dart';

DatabaseHelpers _dbhelpers = DatabaseHelpers();

class EditNote extends StatefulWidget {
  EditNote({@required this.passedID, @required this.passedNote});
  final String passedID;
  final String passedNote;

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController _editNote = TextEditingController();

  @override
  void initState() {
    super.initState();
    _editNote = TextEditingController(text: widget.passedNote);
  }

  @override
  void dispose() {
    _editNote.clear();
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
            controller: _editNote,
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
          _dbhelpers.update(widget.passedID, _editNote.text);
          log('${_editNote.text}', name: 'com.theimpulson.notes: Note Edited');
          Navigator.pop(context);
        },
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
