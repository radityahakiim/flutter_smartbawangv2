import 'package:flutter_smartbawangv2/db_local/db_helper.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';

class AuthService {
  final DBHelper dbHelper = DBHelper.db;

  Future<bool> register(User user) async {
    try {
      bool exists = await dbHelper.userExists(user.email, user.nomorHp);
      if (exists) {
        return false;
      }
      await dbHelper.insertUser(user);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<User?> login(String emailOrPhone, String password) async {
    try {
      return await dbHelper.getUser(emailOrPhone, password);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
