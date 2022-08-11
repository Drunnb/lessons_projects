import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'MyDatabase.db';
  static const _databaseVersion = 1;
  static const table = 'my_table';
  static const columnId = 'id';
  static const columnTitle = 'birdName';
  static const columnDescription = 'birdDescription';
  static const columnUrl = 'url';
  static const longitude = 'longitude';
  static const latitude = 'latitude';

  // Singleton
  DatabaseHelper._privedConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privedConstructor();
  // inly one add-wide reference to database
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationSupportDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database database, int version) async {
    await database.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnTitle TEXT NOT NULL,
        $columnDescription TEXT NOT NULL,
        $columnUrl TEXT NOT NULL,
        $latitude REAL NOT NULL,
        $longitude REAL NOT NULL) 
      ''');
  }

  Future<int?> incert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return db!.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> qureyAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId=?', whereArgs: [id]);
  }
}
