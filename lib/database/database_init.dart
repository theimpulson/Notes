import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

class DatabaseInit {
  // Intializes a SQL database in the app-specific database directory

  static const TABLE_NAME = 'notes';
  static const ID = 'id';
  static const NOTE = 'note';
  static const VERSION = 1;

  Future<String> dbPath() async {
    return join(await getDatabasesPath(), 'notesDB.db');
  }

  Future<Database> connectDB() async {
    return await openDatabase(
      await dbPath(),
      version: VERSION,
      onCreate: (db, version) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('dbID', 0);
        return db.execute(
          "CREATE TABLE $TABLE_NAME($ID INTEGER PRIMARY KEY, $NOTE TEXT)",
        );
      },
    );
  }
}
