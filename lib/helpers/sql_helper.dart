import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = 'database3.db';
  static final _databaseVersion = 1;

  static final tableRestaurant = 'restaurant';
  static final columnRestaurantId = 'id';
  static final columnRestaurantName = 'name';
  static final columnRestaurantCity = 'city';
  static final columnRestaurantCountry = 'country';
  static final columnRestaurantzipCode = 'zipCode';
  static final columnRestaurantPhone = 'phone';
  static final columnRestaurantImage = 'image';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getDatabasesPath();
    final path = join(documentsDirectory, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableRestaurant (
        $columnRestaurantId INTEGER PRIMARY KEY,
        $columnRestaurantName TEXT NOT NULL,
        $columnRestaurantCity TEXT NOT NULL,
        $columnRestaurantCountry TEXT NOT NULL,
        $columnRestaurantzipCode TEXT NOT NULL,
        $columnRestaurantPhone TEXT NOT NULL,
        $columnRestaurantImage TEXT NOT NULL
      )
   ''');
  }

  static Future<int> insert(String table, Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert(table, row);
  }

  static Future<int> update(String table, Map<String, dynamic> row) async {
    final db = await instance.database;
    final id = row['id'];
    return await db.update(table, row, where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> delete(
      String table, String whereClause, List<dynamic> whereArgs) async {
    final db = await instance.database;
    return await db.delete(table, where: whereClause, whereArgs: whereArgs);
  }

  static Future<List<Map<String, dynamic>>> queryAll(String table) async {
    final db = await instance.database;
    return await db.query(table);
  }

  static Future<List<Map<String, dynamic>>> query(
      String table, String whereClause, List<dynamic> whereArgs) async {
    final db = await instance.database;
    return await db.query(table, where: whereClause, whereArgs: whereArgs);
  }
}
