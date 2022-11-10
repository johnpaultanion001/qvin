// ignore_for_file: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user_model.dart';

class SQLite {
  static late Database _db;

  static Future<void> _onCreate(Database db, int ver) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableUser ( 
        ${UserField.id} $idType, 
        ${UserField.display_name} $textType,
        ${UserField.email} $textType,
        ${UserField.type} $textType
        )
      ''');
  }

  static Future<void> init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'db_qvin.db'),
      version: 1,
      onCreate: _onCreate,
    );

    print('db_location:' + await getDatabasesPath());
  }

  static Database get db => _db;
}

class SQLiteHelper {
  //GET ALL USERS
  Future<List<Map<String, dynamic>>> get user async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    int? id = storage.getInt('id');

    return SQLite.db.query(
      tableUser,
      where: 'id=?',
      whereArgs: [id],
      limit: 1,
    );
  }

  //INSERT DATA FROM API TO SLQLITE
  Future<int> insertNote(Map<String, dynamic> user) async {
    return SQLite.db.insert(
      tableUser,
      user,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //GET PROFILE
  // Future<dynamic> getProfile(int id) async {
  //   return SQLite.db.query(
  //     tableUser,
  //     where: 'id=?',
  //     whereArgs: [id],
  //     limit: 1,
  //   );
  // }

  // Future<int> deleteNote(int id) async {
  //   return SQLite.db.delete(
  //     tableNotes,
  //     where: '_id=?',
  //     whereArgs: [id],
  //   );
  // }

  // Future<int> completed(int id, bool status) async {
  //   return SQLite.db.update(
  //     tableNotes,
  //     {'isCompleted': status},
  //     where: '_id=?',
  //     whereArgs: [id],
  //   );
  // }

  // Future<int> important(int id, bool status) async {
  //   return SQLite.db.update(
  //     tableNotes,
  //     {'isPriority': status},
  //     where: '_id=?',
  //     whereArgs: [id],
  //   );
  // }

}
