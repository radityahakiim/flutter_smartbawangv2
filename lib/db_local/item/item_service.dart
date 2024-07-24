import 'package:flutter_smartbawangv2/db_local/db_helper.dart';
import 'package:flutter_smartbawangv2/db_local/item_model.dart';

class ItemService {
  final DBHelper _dbHelper = DBHelper.db;

  Future<int> insertItem(Item item) async {
    return await _dbHelper.insertItem(item);
  }

  Future<List<Item>> getItemsByUser(int userId) async {
    return await _dbHelper.getUserItems(userId);
  }

  Future<int> deleteItem(int itemId) async {
    return await _dbHelper.deleteItem(itemId);
  }

  Future<int> updateItemOwnership(int itemId, int newOwnerId) async {
    return await _dbHelper.updateItemOwner(itemId, newOwnerId);
  }

  Future<List<Item>> getPetaniItemsfromUser(int userId, int petaniId) async {
    return await _dbHelper.getUserItemsPetani(userId, petaniId);
  }

  Future<int> updateExistingItems(Item item) async {
    return await _dbHelper.updateItem(item);
  }
}
