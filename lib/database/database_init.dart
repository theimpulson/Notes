import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

class DatabaseInit {
  /// Intializes a SQL database in the app-specific database directory
  /// using singleton pattern. Use [DatabaseInit.instance] to get an instance
  /// of the class

  // Make the class singleton as database instances are expensive
  DatabaseInit._privateConstructor();
  static final DatabaseInit instance = DatabaseInit._privateConstructor();

  static const TABLE_NAME = 'notes';
  static const ID = 'id';
  static const NOTE = 'note';
  static const VERSION = 1;

  Future<String> dbPath() async {
    return join(await getDatabasesPath(), 'notesDB.db');
  }

  Future<Database> connectDB() async {
    /// Opens a database connection at the given path, creates if non-existing
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
