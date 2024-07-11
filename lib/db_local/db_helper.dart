import 'package:flutter_smartbawangv2/db_local/item_model.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;
  static final DBHelper db = DBHelper._();

  DBHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(path, version: 2, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
         id INTEGER PRIMARY KEY AUTOINCREMENT,
         namaLengkap TEXT,
         role TEXT,
         namaBisnis TEXT,
         alamatBisnis TEXT,
         provinsi TEXT,
         kota TEXT,
         email TEXT,
         nomorHp TEXT,
         password TEXT
         )
        ''');

    await db.execute('''
      CREATE TABLE items(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id INTEGER,
      petani_id INTEGER,
      item_name TEXT,
      item_desc TEXT,
      quantity INTEGER,
      price FLOAT,
      tanggal_panen DATE,
      FOREIGN KEY(user_id) REFERENCES users(id),
      FOREIGN KEY(petani_id) REFERENCES users(id)
      )
      ''');
  }

  // Fungsi tambah user
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

  // Fungsi get user
  Future<User?> getUser(String emailOrPhone, String password) async {
    final db = await database;
    final res = await db.query(
      'users',
      where: '(email = ? or nomorHp = ?) AND password = ?',
      whereArgs: [emailOrPhone, emailOrPhone, password],
    );

    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getUsersByKotaAndRole(
      String kota, String role) async {
    final db = await database;
    final res = await db.query('users',
        where: 'kota = ? AND role = ?', whereArgs: [kota, role]);
    return res;
  }

  Future<List<Map<String, String>>> getKotaAndProvinsiListByRole(
      String role) async {
    final db = await database;
    final res = await db.rawQuery(
        'SELECT DISTINCT kota, provinsi FROM users WHERE role = ?', [role]);
    return res
        .map((json) => {
              'kota': json['kota'] as String,
              'provinsi': json['provinsi'] as String
            })
        .toList();
  }

  // Cek kalau user sudah ada
  Future<bool> userExists(String email, String phone) async {
    final db = await database;
    final res = await db.query(
      'users',
      where: 'email = ? OR nomorHp = ?',
      whereArgs: [email, phone],
    );
    return res.isNotEmpty;
  }

  // Item section

  // Insert Items
  Future<int> insertItem(Item item) async {
    final db = await database;
    return await db.insert('items', item.toMap());
  }

  // get items by user
  Future<List<Item>> getUserItems(int userId) async {
    final db = await database;
    final res =
        await db.query('items', where: 'user_id = ?', whereArgs: [userId]);
    return res.isNotEmpty ? res.map((c) => Item.fromMap(c)).toList() : [];
  }

  Future<List<Item>> getUserItemsPetani(int userId, int petaniId) async {
    final db = await database;
    final res = await db.query('items',
        where: 'user_id = ? AND petani_id = ?', whereArgs: [userId, petaniId]);
    return res.isNotEmpty ? res.map((c) => Item.fromMap(c)).toList() : [];
  }

  // Update item ownership (literally buying the items)
  Future<int> updateItemOwner(int itemId, int newOwnerId) async {
    final db = await database;
    return await db.update(
      'items',
      {'user_id': newOwnerId},
      where: 'id = ?',
      whereArgs: [itemId],
    );
  }

  Future<int> deleteItem(int itemId) async {
    final db = await database;
    return await db.delete('items', where: 'id = ?', whereArgs: [itemId]);
  }
}
