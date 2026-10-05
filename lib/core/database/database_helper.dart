import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/product_model.dart';

class DatabaseHelper {
  /// Singleton
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'shopping.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE product(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        quantity TEXT
      )
    ''');
  }

  Future<int> insertProduct(Product product) async {
    final db = await database;
    return await db.insert(
      'product',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // READ
  Future<List<Product>> getProduct() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('product');
    return List.generate(maps.length, (i) => Product.fromMap(maps[i]));
  }

  // UPDATE
  Future<int> updateProduct(Product product) async {
    final db = await database;
    return await db.update(
      'product',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  // DELETE
  Future<int> deleteProduct(int id) async {
    final db = await database;
    return await db.delete('product', where: 'id = ?', whereArgs: [id]);
  }
}
