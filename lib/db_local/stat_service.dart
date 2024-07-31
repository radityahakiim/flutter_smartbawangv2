import 'package:flutter_smartbawangv2/db_local/db_helper.dart';

class StatService {
  Future<List<Map<String, dynamic>>> fetchWeeklyPetaniStat(int userId) async {
    return DBHelper.db.fetchWeeklyStatisticPetani(userId);
  }
}
