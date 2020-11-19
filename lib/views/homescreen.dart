import 'package:flutter/material.dart';
import 'package:notes/views/edit_note.dart';
import 'package:notes/views/new_note.dart';
import 'package:notes/database/database_helpers.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  Future<List<Map<String, dynamic>>> startAsyncInit() async {
    return await DatabaseHelpers().queryAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: startAsyncInit(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                setState(() {
                  count = snapshot.data.length;
                });
              });
              return ListView.builder(
                itemCount: snapshot == null ? 0 : snapshot.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        key: Key(snapshot.data[index]['id'].toString()),
                        title: Text(snapshot.data[index]['note']),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return EditNote(
                                  passedID:
                                      snapshot.data[index]['id'].toString(),
                                  passedNote: snapshot.data[index]['note'],
                                );
                              },
                            ),
                          );
                        },
                      ),
                      Divider(),
                    ],
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
