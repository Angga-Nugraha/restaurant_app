import 'package:dicoding_restaurant_app/data/models/restaurant_model.dart';
import 'package:sqflite/sqflite.dart';

import '../models/search_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tblRestaurant = 'restaurant';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/restaurant.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblRestaurant (
           id TEXT  PRIMARY KEY,
           name TEXT,
           title TEXT,
           description TEXT,
           pictureId TEXT ,
           city TEXT,
           rating FLOAT
         )     
      ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();

    return _database;
  }

  Future<void> insertFavorite(Restaurant restaurants) async {
    final db = await database;
    await db!.insert(_tblRestaurant, restaurants.toJson());
  }

  Future<void> insertFavoriteFromSearch(RestaurantSearch restaurants) async {
    final db = await database;
    await db!.insert(_tblRestaurant, restaurants.toJson());
  }

  Future<List<Restaurant>> getFavorite() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblRestaurant);

    return results.map((json) => Restaurant.fromJson(json)).toList();
  }

  Future<Map> getFavoriteById(String id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblRestaurant,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeFavorite(String id) async {
    final db = await database;

    await db!.delete(
      _tblRestaurant,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
