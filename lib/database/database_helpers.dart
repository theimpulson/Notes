import 'package:shared_preferences/shared_preferences.dart';

import 'package:notes/database/database_init.dart';

class DatabaseHelpers {
  /// Contains various helper functions to manage database
  ///
  /// Contains 4 functions namely queryAll, insert, delete & update
  /// All functions are asynchronous and returns a Future

  Future<List<Map<String, dynamic>>> queryAll() async {
    /// Returns a List of all notes present in database
    ///
    /// List contains Maps having 'id' and 'note' as keys
    final db = await DatabaseInit.instance.connectDB();

    return db.rawQuery(
      "SELECT ${DatabaseInit.ID},${DatabaseInit.NOTE} FROM ${DatabaseInit.TABLE_NAME}",
    );
  }

  Future<void> insert(String text) async {
    /// Inserts the given [text] into the database
    ///
    /// Uses [dbID] as id to store the corresponding text stored in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int idValue = prefs.getInt('dbID')!;
    final db = await DatabaseInit.instance.connectDB();

    await db.rawInsert(
      "INSERT INTO ${DatabaseInit.TABLE_NAME} (${DatabaseInit.ID}, ${DatabaseInit.NOTE}) VALUES (?, ?)",
      [idValue.toString(), text], // Use parameters to avoid type errors
    );
    prefs.setInt('dbID', idValue + 1);
  }

  Future<void> delete(String id) async {
    /// Deletes the note from the database using the given [id]
    final db = await DatabaseInit.instance.connectDB();

    await db.rawDelete(
      "DELETE FROM ${DatabaseInit.TABLE_NAME} WHERE ${DatabaseInit.ID} = $id",
    );
  }

  Future<void> update(String id, String text) async {
    /// Updates an exisiting note in the database using given [id] and [text]
    final db = await DatabaseInit.instance.connectDB();

    await db.rawUpdate(
      "UPDATE ${DatabaseInit.TABLE_NAME} SET ${DatabaseInit.NOTE} = '$text' WHERE ${DatabaseInit.ID} = $id",
    );
  }
}
