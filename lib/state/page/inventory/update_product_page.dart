import 'package:flutter/material.dart';
//import 'package:flutter_smartbawangv2/db_local/item/item_controller.dart';
import 'package:flutter_smartbawangv2/db_local/item/item_controller_update.dart';
import 'package:flutter_smartbawangv2/db_local/item_model.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:flutter_smartbawangv2/state/materials/textbox.dart';
// import 'package:provider/provider.dart';

class UpdateProductPage extends StatefulWidget {
  final Item item;
  final User user;
  final GlobalKey<ScaffoldMessengerState> scaffoldkey;
  final VoidCallback onRefresh;

  const UpdateProductPage({
    super.key,
    required this.scaffoldkey,
    required this.item,
    required this.onRefresh,
    required this.user,
  });

  @override
  State<UpdateProductPage> createState() => _UpdateProductPage();
}

class _UpdateProductPage extends State<UpdateProductPage> {
  late ItemControllerUpdate itemControllerUpdate;
  final List<Map<String, String>> dropdownSatuan = [
    {"display": "Kg", "value": "kg"},
    {"display": "Ton", "value": "ton"},
  ];

  @override
  void initState() {
    super.initState();
    itemControllerUpdate = ItemControllerUpdate(
        namaProduk: widget.item.itemName,
        deskripsiProduk: widget.item.itemDesc,
        jumlahProduk: widget.item.quantity.toString(),
        hargaPerKg: widget.item.price.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Update Produk",
          style: const TextStyle(
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
                  controller: itemControllerUpdate.namaProdukController,
                ),
                const SizedBox(height: 8),
                CustomTextBox(
                    textboxDesc: "Deskripsi Produk",
                    textboxHint: "Masukkan deskripsi",
                    isCustomSize: true,
                    custHeight: 112,
                    isMultiline: true,
                    controller: itemControllerUpdate.deskripsiProdukController),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextBox(
                        textboxDesc: "Jumlah",
                        textboxHint: "Masukkan Jumlah",
                        controller: itemControllerUpdate.jumlahProdukController,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextBox(
                        textboxDesc: "Satuan",
                        textboxHint: "Pilih Satuan",
                        isDdFormField: true,
                        dropdownItems: dropdownSatuan,
                        selectedItem: itemControllerUpdate.satuanJumlahProduk,
                        onChanged: (value) {
                          itemControllerUpdate.setSatuanJumlahProduk(value);
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                CustomTextBox(
                  textboxDesc: "Harga (per kg)",
                  textboxHint: "Masukkan Harga per kg",
                  controller: itemControllerUpdate.hargaPerKgController,
                ),
              ],
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: false,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomButton(
          text: 'Update Produk',
          onPressed: () async {
            itemControllerUpdate.updateExistingItems(
                context, widget.scaffoldkey, widget.user);
            widget.onRefresh();
            Navigator.pop(context, true);
          },
        ),
      ),
    );
  }
}
