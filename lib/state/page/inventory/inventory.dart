import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/item/item_service.dart';
import 'package:flutter_smartbawangv2/db_local/item_model.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/searchbox.dart';
import 'package:flutter_smartbawangv2/state/page/cari_user/cari_user.dart';
import 'package:flutter_smartbawangv2/state/page/inventory/add_product_page.dart';
import 'package:flutter_smartbawangv2/state/page/market_inventory_materials/market_inventory_itembox.dart';

typedef RoleSelectedCallback = void Function(String role);

class InventoryPage extends StatefulWidget {
  final User user;
  final GlobalKey<ScaffoldMessengerState> scaffoldkey;
  final RoleSelectedCallback? onRoleSelected;
  const InventoryPage(
      {super.key,
      required this.user,
      required this.scaffoldkey,
      this.onRoleSelected});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  late Future<List<Item>> _futureItems;
  ItemService itemService = ItemService();
  void loadItems() {
    _futureItems = itemService.getItemsByUser(widget.user.id!);
  }

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void refresh() {
    setState(() {
      loadItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    String role = widget.user.role;
    String scaffoldTitle = '';
    // Menentukan tombol cari pasar atau cari petani
    String cariPasar = 'Cari Pasar';
    String cariPetani = 'Cari Petani';
    late String currentCariUser;

    if (role == 'petani') {
      currentCariUser = cariPasar;
    } else {
      currentCariUser = cariPetani;
    }

    switch (role) {
      case 'petani':
        scaffoldTitle = 'Produk Panen Anda';
      case 'pasar':
        scaffoldTitle = 'Produk di pasar Anda';
      case 'pengepul':
        scaffoldTitle = 'Produk warehouse Anda';
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 68,
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: Text(
          scaffoldTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              CustSearchBox(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    scaffoldTitle,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (widget.user.role == 'petani') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CariUser(role: 'pasar')),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CariUser(role: 'petani')),
                        );
                      }
                    },
                    child: Text(
                      currentCariUser,
                      style: TextStyle(
                        color: AppTheme.colorBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.symmetric(horizontal: 8),
              //       height: 28,
              //       decoration: ShapeDecoration(
              //         shape: RoundedRectangleBorder(
              //           side: const BorderSide(
              //               width: 1, color: Color(0xFF78287E)),
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //       ),
              // child: const Align(
              //   alignment: Alignment.center,
              //   child: Text(
              //     "Terjual",
              //     style: TextStyle(
              //       color: Color(0xFF78287E),
              //       fontSize: 12,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              //     ),
              //     const SizedBox(width: 8),
              //     Container(
              //       padding: const EdgeInsets.symmetric(horizontal: 8),
              //       height: 28,
              //       decoration: ShapeDecoration(
              //         shape: RoundedRectangleBorder(
              //           side: BorderSide(width: 1, color: Color(0xFF78287E)),
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //       ),
              //       child: Align(
              //         alignment: Alignment.center,
              //         child: Text(
              //           "Belum Terjual",
              //           style: TextStyle(
              //             color: Color(0xFF78287E),
              //             fontSize: 12,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              const SizedBox(height: 8),
              FutureBuilder(
                  future: _futureItems,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text('Terjadi Kesalahan: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No items found'));
                    } else {
                      var items = snapshot.data!;
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          var item = items[index];
                          return MarketInvItemBox(
                            imageasset: 'assets/bawang.png',
                            title: item.itemName,
                            tanggal: item.tanggalPanen,
                            harga: item.price,
                            item: item,
                            voidCallback: () {
                              refresh();
                            },
                          );
                        },
                      );
                    }
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: role == 'petani'
          ? FloatingActionButton(
              onPressed: () async {
                final result = Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddProductPage(
                            scaffoldkey: widget.scaffoldkey,
                            user: widget.user,
                            onRefresh: () {
                              refresh();
                            },
                          )),
                );
                if (result == true) {
                  setState(() {
                    loadItems();
                  });
                }
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

/// Below is a dummy item data using row
 // Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     MarketInvItemBox(
//       imageasset: 'assets/bawang.png',
//       title: "Bawang Sembrani",
//       tanggal: "31 Dec 2021",
//       harga: "Rp12.000",
//     ),
//     MarketInvItemBox(
//       imageasset: 'assets/bawang.png',
//       title: "Bawang Sembrani",
//       tanggal: "31 Dec 2021",
//       harga: "Belum Terjual",
//     )
//   ],
// ),