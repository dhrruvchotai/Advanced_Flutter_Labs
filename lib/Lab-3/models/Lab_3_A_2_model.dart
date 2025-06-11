import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? _personDB;
  List<Map<String, dynamic>> _users = [];

  DatabaseService() {
    initDatabase();
  }

  Future<void> initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      _personDB = await openDatabase(
        path.join(dbPath, 'personDB.db'),
        version: 1,
        onCreate: (db, version) async {
          print("Creating Table..");
          await db.execute(
            "CREATE TABLE person(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL)",
          );
          print("Table Created Successfully!");
        },
      );
    } catch (e) {
      print("Database initialization error : $e");
    }
  }
}
