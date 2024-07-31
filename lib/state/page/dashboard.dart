// Dashboard untuk Petani dan Pengepul
// Dashboard ini akan memantau pasar di daerah sekitar

import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/item/item_service.dart';
import 'package:flutter_smartbawangv2/db_local/item_model.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/AppScrollBehaviour.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/main_navigation.dart';
import 'package:flutter_smartbawangv2/state/page/cari_user/cari_user.dart';
import 'package:flutter_smartbawangv2/state/page/dashboard_materials/dashboard_button.dart';
import 'package:flutter_smartbawangv2/state/page/dashboard_materials/dashboard_box.dart';
import 'package:flutter_smartbawangv2/state/page/dashboard_materials/dashboard_itembox.dart';
// import 'package:flutter_smartbawangv2/state/page/dashboard_materials/dashboard_itembox.dart';
import 'package:flutter_smartbawangv2/state/page/market_inventory_materials/market_inventory_itembox.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  final User user;
  const DashboardPage({super.key, required this.user});

  @override
  State<DashboardPage> createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  ItemService itemService = ItemService();
  late Future<List<Item>> _futureItems;
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
    late String titleForInv;
    switch (role) {
      case 'petani':
        titleForInv = 'Produk Panen Anda';
      case 'pasar':
        titleForInv = 'Produk di pasar Anda';
      case 'pengepul':
        titleForInv = 'Produk warehouse Anda';
    }
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(130),
            child: Column(children: [
              Container(
                // Header dari dashboard page
                height: 150,
                decoration: const ShapeDecoration(
                    color: AppTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)))),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Row(
                            // Logo Smart System Bawang Merah
                            children: [
                              const SizedBox(width: 8),
                              Image.asset('assets/logo.png'),
                              const SizedBox(width: 10),
                              const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Smart System",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    'Bawang Merah',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              )
                            ],
                          ), // End of Logo
                          const Spacer(),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.notifications),
                                  color: Colors.white),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  ))
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Selamat Datang, ${widget.user.namaLengkap}!",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 4,
                      // ),
                      // Container(
                      //   padding: EdgeInsets.all(8),
                      //   height: 30,
                      //   decoration: ShapeDecoration(
                      //     color: Color(0xFFEFEFEF),
                      //     shape: RoundedRectangleBorder(
                      //       side: BorderSide(width: 1, color: Colors.white),
                      //       borderRadius: BorderRadius.circular(18),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ])),
        // Body
        body: ScrollConfiguration(
            behavior: AppScrollBehaviour(),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.user.role == 'pasar'
                          ? 'Informasi Pasar'
                          : 'Informasi pasar di daerah Anda',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  DashboardBox(user: widget.user),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DashboardButton(
                          iconData: Icons.search,
                          text: widget.user.role == 'petani'
                              ? "Cari Pasar"
                              : "Cari Petani/Pasar",
                          onPressed: () {
                            if (widget.user.role == 'petani') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CariUser(
                                          role: 'pasar',
                                          user: widget.user,
                                        )),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CariUser(
                                          role: 'petani',
                                          user: widget.user,
                                        )),
                              );
                            }
                          }),
                      DashboardButton(
                          iconData: Icons.store,
                          text: "Cek/Jual Stok",
                          onPressed: () {
                            Provider.of<PageIndexProvider>(context,
                                    listen: false)
                                .changeIndex(1);
                          }),
                      DashboardButton(
                          iconData: Icons.bar_chart,
                          text: "Statistik",
                          onPressed: () {
                            Provider.of<PageIndexProvider>(context,
                                    listen: false)
                                .changeIndex(2);
                          }),
                      DashboardButton(
                          iconData: Icons.local_shipping,
                          text: "Cek Record Supply",
                          onPressed: () {}),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          titleForInv,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Provider.of<PageIndexProvider>(context,
                                    listen: false)
                                .changeIndex(1);
                          },
                          child: Text(
                            'Selengkapnya',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppTheme.colorBlue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  ScrollConfiguration(
                      behavior: AppScrollBehaviour(),
                      child: Container(
                          height: 128,
                          child: FutureBuilder(
                              future: _futureItems,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text(
                                          'Terjadi Kesalahan: ${snapshot.error}'));
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return const Center(
                                      child: Text('No items found'));
                                } else {
                                  var items = snapshot.data!;
                                  return GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            crossAxisSpacing: 16,
                                            mainAxisSpacing: 16),
                                    itemCount: items.length,
                                    itemBuilder: (context, index) {
                                      GlobalKey<ScaffoldMessengerState>
                                          scaffoldKey = GlobalKey();
                                      var item = items[index];
                                      return DashboardItemBox(
                                          imageasset: 'assets/bawang.png',
                                          title: item.itemName,
                                          tanggal: item.tanggalPanen);
                                    },
                                  );
                                }
                              })))
                ]),
              ),
            )));
  }
}
