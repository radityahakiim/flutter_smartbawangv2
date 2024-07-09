import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/item/item_controller.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:flutter_smartbawangv2/state/materials/textbox.dart';
// import 'package:provider/provider.dart';

class AddProductPage extends StatefulWidget {
  final User user;
  final GlobalKey<ScaffoldMessengerState> scaffoldkey;
  final VoidCallback onRefresh;
  const AddProductPage(
      {super.key,
      required this.scaffoldkey,
      required this.user,
      required this.onRefresh});

  @override
  State<AddProductPage> createState() => _AddProductPage();
}

class _AddProductPage extends State<AddProductPage> {
  final List<Map<String, String>> dropdownSatuan = [
    {"display": "Kg", "value": "kg"},
    {"display": "Ton", "value": "ton"},
  ];
  @override
  Widget build(BuildContext context) {
    final itemController = ItemController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Tambah Produk",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 0.07,
            letterSpacing: -0.34,
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomTextBox(
                  textboxDesc: "Nama Produk",
                  textboxHint: "Masukkan nama Produk",
                  isCustomSize: true,
                  isMultiline: true,
                  custHeight: 75,
                  useCounter: true,
                  maxLength: 40,
                  controller: itemController.namaProdukController,
                ),
                const SizedBox(height: 8),
                CustomTextBox(
                    textboxDesc: "Deskripsi Produk",
                    textboxHint: "Masukkan deskripsi",
                    isCustomSize: true,
                    custHeight: 112,
                    isMultiline: true,
                    controller: itemController.deskripsiProdukController),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextBox(
                        textboxDesc: "Jumlah",
                        textboxHint: "Masukkan Jumlah",
                        controller: itemController.jumlahProdukController,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextBox(
                        textboxDesc: "Satuan",
                        textboxHint: "Pilih Satuan",
                        isDdFormField: true,
                        dropdownItems: dropdownSatuan,
                        selectedItem: itemController.satuanJumlahProduk,
                        onChanged: (value) {
                          itemController.setSatuanJumlahProduk(value);
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                CustomTextBox(
                  textboxDesc: "Harga (per kg)",
                  textboxHint: "Masukkan Harga per kg",
                  controller: itemController.hargaPerKgController,
                ),
              ],
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: false,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomButton(
          text: 'Tambah Produk',
          onPressed: () async {
            itemController.addItems(context, widget.scaffoldkey, widget.user);
            widget.onRefresh();
            Navigator.pop(context, true);
          },
        ),
      ),
    );
  }
}
