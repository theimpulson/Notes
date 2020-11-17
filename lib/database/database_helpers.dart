import 'package:notes/database/database_init.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelpers extends DatabaseInit {
  // Contains various helper functions to manage database via SQL

  Future<List<Map<String, dynamic>>> queryAll() async {
    final db = await connectDB();

    return db.rawQuery(
      "SELECT ${DatabaseInit.ID},${DatabaseInit.NOTE} FROM ${DatabaseInit.TABLE_NAME}",
    );
  }

  Future<void> insert(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int idValue = prefs.getInt('dbID');
    final db = await connectDB();

    await db.rawInsert(
      "INSERT INTO ${DatabaseInit.TABLE_NAME} (${DatabaseInit.ID}, ${DatabaseInit.NOTE}) VALUES (?, ?)",
      [idValue.toString(), text], // Use parameters to avoid type errors
    );
    prefs.setInt('dbID', idValue + 1);
  }

  Future<void> delete(String id) async {
    final db = await connectDB();

    await db.rawDelete(
      "DELETE FROM ${DatabaseInit.TABLE_NAME} WHERE $id",
    );
  }

  Future<void> update(String id, String text) async {
    final db = await connectDB();

    await db.rawUpdate(
      "UPDATE ${DatabaseInit.TABLE_NAME} SET ${DatabaseInit.NOTE} = '$text' WHERE ${DatabaseInit.ID} = $id",
    );
  }
}
