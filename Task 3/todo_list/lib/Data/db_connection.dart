import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbConnection {
  Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'Local.db');
    return openDatabase(path, version: 1, onCreate: createDatabase);
  }

  Future<void> createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todolist (
        id INTEGER PRIMARY KEY,
        title TEXT
      )
    ''');
  }

  Future<void> insertData(String title) async {
    final db = await getDatabase();
    await db.insert('todolist', {'title': title});
  }

  Future<List<Map<String, dynamic>>> readData() async {
    final db = await getDatabase();
    return await db.query('todolist');
  }

  Future<void> deleteData(int id) async {
    final db = await getDatabase();
    await db.delete('todolist', where: 'id = ?', whereArgs: [id]);
  }
}
