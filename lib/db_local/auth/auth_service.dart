import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/db_helper.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';

class AuthService with ChangeNotifier {
  User? currentUser;
  final DBHelper dbHelper = DBHelper.db;

  User? get user => currentUser;

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
      User? user = await dbHelper.getUser(emailOrPhone, password);
      if (user != null) {
        currentUser = user;
        notifyListeners();
      }
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void logout() {
    currentUser = null;
    notifyListeners();
  }
}
