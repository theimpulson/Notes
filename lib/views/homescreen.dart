import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/themes/system_overlay.dart';
import 'package:notes/views/drawer.dart';
import 'package:notes/views/edit_note.dart';
import 'package:notes/views/new_note.dart';
import 'package:notes/database/database_helpers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? count = 0;

  @override
  Widget build(BuildContext context) {
    // Set proper system overlays
    setSystemOverlay();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        brightness: Brightness.light,
        elevation: 0.5,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: DatabaseHelpers().queryAll(),
          builder: (context, snapshot) {
            // typecast snapshot.data to avoid type errors
            var notes = snapshot.data as List<Map<String, dynamic>>;

            if (snapshot.hasData) {
              WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                setState(() {
                  count = notes.length;
                });
              });

              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      alignment: AlignmentDirectional.centerEnd,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    key: Key(notes[index]['id'].toString()),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(notes[index]['note']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EditNote(
                                    passedID: notes[index]['id'].toString(),
                                    passedNote: notes[index]['note'],
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        Divider(),
                      ],
                    ),
                    onDismissed: (direction) {
                      DatabaseHelpers().delete(notes[index]['id'].toString());
                    },
                    direction: DismissDirection.endToStart,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return Container(
                alignment: AlignmentDirectional.center,
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      drawer: LocalDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewNote(),
            ),
          );
        },
      ),
    );
  }
}
