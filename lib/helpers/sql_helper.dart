import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = 'database9.db';
  static final _databaseVersion = 1;

  static final tableRestaurant = 'restaurant';
  static final columnRestaurantId = 'id';
  static final columnRestaurantName = 'name';
  static final columnRestaurantCity = 'city';
  static final columnRestaurantCountry = 'country';
  static final columnRestaurantzipCode = 'zipCode';
  static final columnRestaurantPhone = 'phone';
  static final columnRestaurantImage = 'image';

  static final tableCategory = 'category';
  static final columnCategoryId = 'id';
  static final columnCategoryTitle = 'title';
  static final columnCategoryDescription = 'description';
  static final columnCategoryImage = 'image';

  static final tableDash = 'dash';
  static final columnDashId = 'id';
  static final columnDashTitle = 'title';
  static final columnDashDescription = 'description';
  static final columnDashPrice = 'price';
  static final columnDashImage = 'image';
  static final columnDashCategoryId = 'categoryId';
  static final columnDashRestaurantId = 'restaurantId';

  static final tableCommand = 'command';
  static final columnCommandId = 'id';
  static final columnCommandStatus = 'status';
  static final columnCommandCreatedAt = 'createdAt';
  static final columnCommandTTC = 'ttc';

  static final tableCommandItem = 'commandItem';
  static final columnCommandItemId = 'id';
  static final columnCommandItemQuantity = 'quantity';
  static final columnCommandItemTTC = 'ttc';
  static final columnCommandItemCommandId = 'command_id';
  static final columnCommandItemDishId = 'dish_id';

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

    await db.execute('''
      CREATE TABLE $tableCategory (
        $columnCategoryId INTEGER PRIMARY KEY,
        $columnCategoryTitle TEXT NOT NULL,
        $columnCategoryDescription TEXT NOT NULL,
        $columnCategoryImage TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableDash (
        $columnDashId INTEGER PRIMARY KEY,
        $columnDashTitle TEXT NOT NULL,
        $columnDashDescription TEXT NOT NULL,
        $columnDashImage TEXT NOT NULL,
        $columnDashCategoryId INTEGER,
        $columnDashPrice REAL NOT NULL,
        $columnDashRestaurantId INT NOT NULL,
        FOREIGN KEY (restaurantId) REFERENCES restaurant (id),
        FOREIGN KEY (categoryId) REFERENCES category (id)
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableCommand (
        $columnCommandId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnCommandTTC REAL,
        $columnCommandStatus BOOLEAN
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableCommandItem (
        $columnCommandItemId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnCommandItemTTC REAL,
        $columnCommandItemQuantity INTEGER,
        $columnCommandItemCommandId INTEGER,
        $columnCommandItemDishId INTEGER,
        FOREIGN KEY (command_id) REFERENCES command (id),
        FOREIGN KEY (dish_id) REFERENCES dash (id)
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

  // static Future<List<Map<String, dynamic?>>> getLastRow(String table) async {
  //   final db = await instance.database;
  //   return await db.query("SELECT MAX(*) FROM $table");
  // }
}
