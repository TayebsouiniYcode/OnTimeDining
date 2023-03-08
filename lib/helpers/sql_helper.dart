import "package:flutter/foundation.dart";
import "package:sqflite/sqflite.dart" as sql;

class SqlHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE restaurant(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      description TEXT,
      city TEXT,
      country TEXT,
      zip_code TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ) """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dbRestaurant.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTable(database);
      },
    );
  }

  static Future<int> createRestaurant(String name, String? description,
      String? city, String? country, String? zip_code) async {
    final db = await SqlHelper.db();

    final data = {
      "name": name,
      "description": description,
      "city": city,
      "country": country,
      "zip_code": zip_code
    };

    final id = await db.insert('restaurant', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getRestaurants() async {
    final db = await SqlHelper.db();
    return db.query("restaurant", orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getRestaurant(int id) async {
    final db = await SqlHelper.db();
    return db.query("restaurant", where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(int id, String name, String? description,
      String? city, String? country, String? zip_code) async {
    final db = await SqlHelper.db();

    final data = {
      'name': name,
      'description': description,
      'city': city,
      'country': country,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update("restaurant", data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SqlHelper.db();

    try {
      await db.delete("restaurant", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong: $err");
    }
  }
}
