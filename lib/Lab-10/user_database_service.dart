import 'package:advance_flutter_lab/Lab-10/user_model.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class UserDataBaseService {
  late Database userDatabase;

  Future<void> initDatabase() async {
    try {
      final databasePath = await getDatabasesPath();
      userDatabase = await openDatabase(
        path.join(databasePath, 'UserDB.db'),
        version: 1,
        onCreate: (db, version) {
          db.execute(
            "CREATE TABLE User(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)",
          );
        },
      );
    } catch (e) {
      print("Error in initializing database : $e");
    }
  }

  Future<List<MyUser>> fetchUsers() async {
    try {
      List<MyUser> userList = [];
      for (var user in await userDatabase.query('User')) {
        userList.add(MyUser.fromMap(user));
      }
      return userList;
    } catch (e) {
      print("Error in fetching all users : $e");
    }
    return [];
  }

  Future<void> addUser(MyUser user) async {
    try {
      userDatabase.insert('User', MyUser.toMap(user));
    } catch (e) {
      print("Error in adding user : $e");
    }
  }

  Future<void> editUser(MyUser user) async {
    try {
      await userDatabase.update(
        'User',
        {"name": MyUser.toMap(user)["name"]},
        where: "id = ?",
        whereArgs: [user.id],
      );
    } catch (e) {
      print("Error in editing user details : $e");
    }
  }

  Future<void> deleteUser({required int id}) async {
    try {
      await userDatabase.delete('User', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print("Error in deleting user : $e");
    }
  }
}
