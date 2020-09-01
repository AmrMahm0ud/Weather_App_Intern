import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app_intern/model/weather_model.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance =  DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  final String tableName = "weather";
  final String state = "WeatherState";
  final String temp = "temperature";
  final String date = "dateCreated";
  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "weather_db.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName(id INTEGER PRIMARY KEY, $temp TEXT, $date TEXT)");
    print("Table is created");
  }

//insertion
  Future<int> saveItem(Weather item) async {
    var dbClient = await db;
    //int res = await dbClient.insert("$tableName", item.toMap());
  //  print(res.toString());
    //return res;
  }

  //Get
  Future<List> getItems() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName ORDER BY $temp ASC"); //ASC

    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $tableName"
    ));
  }

  Future<Weather> getItem(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName WHERE id = $id");
    if (result.length == 0) return null;
   // return NoDoItem.fromMap(result.first);
  }

  //deletion
  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableName,
        where: "$state = ?", whereArgs: [id]);

  }

  Future<int> updateItem(Weather item) async {
    var dbClient = await db;
  //  return await dbClient.update("$tableName", item.toMap(),
    //    where: "$state = ?", whereArgs: [item.id]);

  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

}