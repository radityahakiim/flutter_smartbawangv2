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
    return await openDatabase(path, version: 1, onCreate: _onCreate);
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
  }

  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

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

  Future<bool> userExists(String email, String phone) async {
    final db = await database;
    final res = await db.query(
      'users',
      where: 'email = ? OR nomorHp = ?',
      whereArgs: [email, phone],
    );
    return res.isNotEmpty;
  }
}
