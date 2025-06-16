import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? _personsDB;
  List<Map<String, dynamic>> _persons = [];

  DatabaseService() {
    initDatabase();
    fetchPersons();
  }

  Future<void> initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      _personsDB = await openDatabase(
        path.join(dbPath, 'personsDB.db'),
        version: 1,
        onCreate: (db, version) async {
          print("Creating Table..");
          await db.execute(
            "CREATE TABLE persons(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL)",
          );
          print("Table Created Successfully!");
        },
      );
    } catch (e) {
      print("Database initialization error : $e");
    }
  }

  Future<List<Map<String, dynamic>>> fetchPersons() async {
    try {
      if (_personsDB == null) {
        await initDatabase();
      }
      _persons = await _personsDB!.query('persons');
      print("Persons : $_persons");
      return _persons;
    } catch (e) {
      print("Error in fetching data from Database : $e");
    }
    return [];
  }

  Future<void> addPerson({required String name}) async {
    try {
      if (_personsDB == null) {
        await initDatabase();
      }
      Map<String, dynamic> person = {};
      person['name'] = name;
      await _personsDB!.insert('persons', person);
      _persons = await fetchPersons();
    } catch (e) {
      print("Error adding person in the table : $e");
    }
  }

  Future<void> deletePerson({required int id}) async {
    if (_personsDB == null) {
      await initDatabase();
    }
    await _personsDB!.delete('persons', where: "id = ?", whereArgs: [id]);
  }

  Future<void> updatePerson({
    required int id,
    required Map<String, dynamic> newUser,
  }) async {
    if (_personsDB == null) {
      await initDatabase();
    }
    await _personsDB!.update(
      "persons",
      newUser,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
