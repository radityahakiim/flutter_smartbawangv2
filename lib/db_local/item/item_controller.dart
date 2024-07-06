import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/item/item_service.dart';
import 'package:flutter_smartbawangv2/db_local/item_model.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';

class ItemController with ChangeNotifier {
  final ItemService itemService = ItemService();
  TextEditingController namaProdukController = TextEditingController();
  TextEditingController deskripsiProdukController = TextEditingController();
  TextEditingController jumlahProdukController = TextEditingController();
  TextEditingController hargaPerKgController = TextEditingController();

  String? _satuanJumlahProduk;
  String? get satuanJumlahProduk => _satuanJumlahProduk;

  void setSatuanJumlahProduk(String? satuan) {
    _satuanJumlahProduk = satuan;
    notifyListeners();
  }

  bool isSatuanJumlahProdukSelected() {
    return _satuanJumlahProduk != null && _satuanJumlahProduk!.isNotEmpty;
  }

  Future<Item?> addItems(BuildContext context,
      GlobalKey<ScaffoldMessengerState> scaffoldKey, User user) async {
    try {
      int quantity = int.parse(jumlahProdukController.text);
      Item item = Item(
          userId: user.id,
          petaniId: user.id,
          itemName: namaProdukController.text,
          quantity: _satuanJumlahProduk == 'ton' ? quantity * 1000 : quantity,
          price: double.parse(hargaPerKgController.text),
          tanggalPanen: DateTime.now(),
          itemDesc: deskripsiProdukController.text);
      await itemService.insertItem(item);
      notifyListeners();
      return item;
    } catch (e) {
      scaffoldKey.currentState
          ?.showSnackBar(SnackBar(content: Text("Terjadi error: $e")));
      return null;
    }
  }
}
