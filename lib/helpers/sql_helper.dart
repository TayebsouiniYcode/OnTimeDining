import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/Restaurant.dart';

class SQLHelper {
  // static final SQLHelper _instance = SQLHelper.internal();
  // factory SQLHelper() => _instance;
  // SQLHelper.internal();
  // Database _database;

  // Future<Database> get database async {
  //   if (_database != null) {
  //     return _database;
  //   }

  //   _database = await _initDatabase();
  //   return _database;
  // }

  // Future<Database> _initDatabase() async {
  //   final String path = await getDatabasesPath();
  //   final String dbPath = join(path, 'ontimediningv2.db');

  //   return await openDatabase(
  //     dbPath,
  //     version: 1,
  //     onCreate: (db, version) async {
  //       await createDatabaseSchema(db, version);
  //     },
  //   );
  // }

  // Future<void> createDatabaseSchema(Database db, int version) async {
  //   await db.execute('''
  //     CREATE TABLE category (
  //       id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
  //       title TEXT,
  //       description TEXT,
  //       image TEXT
  //     )
  //   ''');

  //   await db.execute('''
  //     CREATE TABLE restaurant (
  //       id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
  //       name TEXT NOT NULL,
  //       city TEXT,
  //       country TEXT,
  //       zip_code TEXT,
  //       phone TEXT,
  //       image TEXT,
  //       createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  //     )
  //   ''');

  //   await db.execute('''
  //     CREATE TABLE dash (
  //       id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
  //       title TEXT,
  //       description TEXT,
  //       price REAL,
  //       image TEXT,
  //       category_id INTEGER,
  //       CONSTRAINT fk_category
  //         FOREIGN KEY (category_id)
  //         REFERENCES category(id)
  //     )
  //   ''');

  //   await db.execute('''
  //     CREATE TABLE dashItem (
  //       id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
  //       name TEXT,
  //       image TEXT
  //     )
  //   ''');

  //   await db.execute('''
  //     CREATE TABLE dash_dashItem (
  //       dash_id INTEGER,
  //       dashItem_id INTEGER,
  //       CONSTRAINT fk_dash_dashItem_dash
  //         FOREIGN KEY (dash_id)
  //         REFERENCES dash(id),
  //       CONSTRAINT fk_dash_dashItem_dashItem
  //         FOREIGN KEY (dashItem_id)
  //         REFERENCES dashItem(id),
  //       PRIMARY KEY (dash_id, dashItem_id)
  //     )
  //   ''');

  //   await db.execute('''
  //     CREATE TABLE command (
  //       id INTEGER PRIMARY KEY UNIQUE NOT NULL,
  //       ttc REAL,
  //       status TEXT,
  //       createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  //     )
  //   ''');

  //   await db.execute('''
  //     CREATE TABLE command_item (
  //       id INTEGER PRIMARY KEY UNIQUE NOT NULL,
  //       ttc REAL,
  //       status TEXT,
  //       createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  //       command_id INTEGER,
  //       CONSTRAINT fk_command
  //         FOREIGN KEY (command_id)
  //         REFERENCES command(id)
  //     )
  //   ''');

  //   Restaurant youfood = Restaurant(
  //       id: 1,
  //       name: "YouFood",
  //       city: "Youssoufia",
  //       country: "Morocco",
  //       zipCode: "46300",
  //       image: "img.jpg",
  //       phone: "0607189671",
  //       createdAt: DateTime.now());
  //   Restaurant youcrud = Restaurant(
  //       id: 2,
  //       name: "YouCrud",
  //       city: "Safi",
  //       country: "Morocco",
  //       zipCode: "46400",
  //       image: "img1.jpg",
  //       phone: "0607189671",
  //       createdAt: DateTime.now());
  //   Restaurant youfrensh = Restaurant(
  //       id: 3,
  //       name: "YouFrensh",
  //       city: "Youssoufia",
  //       country: "Morocco",
  //       zipCode: "46300",
  //       image: "img2.jpg",
  //       phone: "0607189671",
  //       createdAt: DateTime.now());

  //   insertRestaurant(youfood);
  //   insertRestaurant(youcrud);
  //   insertRestaurant(youfrensh);
  // }

  // Future<int> insertRestaurant(Restaurant restaurant) async {
  //   final db = await _database;
  //   return await db.insert('restaurant', restaurant.toMap(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  // Future<List<Restaurant>> getRestautants() async {
  //   final db = await _database;
  //   final results = await db.query("restaurant");
  //   return results.map((value) => Restaurant.fromMap(value)).toList();
  // }
}
