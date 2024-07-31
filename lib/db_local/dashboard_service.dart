import 'package:flutter_smartbawangv2/db_local/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class DashboardService {
  Future<Map<String, dynamic>> getPricesFromPasar(
      Database db, String kota) async {
    return await DBHelper.db.getPricesDataFromPasar(db, kota);
  }

  Future<int> sumQtOfItemsOwnedByPasar(Database db, String kota) async {
    return await DBHelper.db.sumQuantityOfItemsOwnedByPasar(db, kota);
  }

  Future<Map<String, dynamic>> getPriceDataForUser(int userId) async {
    return await DBHelper.db.getPricesForUser(userId);
  }

  Future<int> sumQtForUser(int userId) async {
    return await DBHelper.db.sumQuantityForUser(userId);
  }
}
