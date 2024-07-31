import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/item/item_service.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/capitalize_string.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:flutter_smartbawangv2/state/materials/searchbox.dart';
import 'package:flutter_smartbawangv2/state/page/cari_user/overview_item_market_box.dart';
import 'package:flutter_smartbawangv2/state/page/dashboard_materials/dashboard_box.dart';
// import 'package:flutter_smartbawangv2/state/page/market_inventory_materials/market_inventory_itembox.dart';
// import 'package:flutter_smartbawangv2/state/page/market_inventory_materials/market_inventory_itembox.dart';
// import 'package:flutter_smartbawangv2/state/page/market_inventory_materials/test_market_inv_itembox.dart';

class MarketOverviewPage extends StatefulWidget {
  final String namaBisnis;
  final String alamatBisnis;
  final String kota;
  final String prov;
  final String role;
  final int? id;
  final User user;
  final VoidCallback? voidCallback;
  const MarketOverviewPage({
    super.key,
    required this.namaBisnis,
    required this.alamatBisnis,
    required this.kota,
    required this.prov,
    required this.role,
    this.id,
    required this.user,
    this.voidCallback,
  });

  @override
  State<MarketOverviewPage> createState() => _MarketOverviewPage();
}

class _MarketOverviewPage extends State<MarketOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          widget.namaBisnis,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 0.07,
            letterSpacing: -0.34,
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          22.5), // Half of the width/height to make it circular
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/fotosawah.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.namaBisnis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.pin_drop, size: 12),
                            SizedBox(width: 6),
                            Text(
                                "${widget.alamatBisnis} (${widget.kota}, ${widget.prov})",
                                style: TextStyle(fontSize: 10))
                          ],
                        ),
                      ]),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    text: "Chat ${capitalize(widget.role)}",
                    onPressed: () {},
                    isCustomSize: true,
                    custHeight: 30,
                    custWidth: 160),
                CustomButton(
                    text: "Informasi ${capitalize(widget.role)}",
                    onPressed: () {},
                    isWhiteButton: true,
                    isCustomSize: true,
                    custHeight: 30,
                    custWidth: 160)
              ],
            ),
            const SizedBox(height: 8),
            CustSearchBox(),
            SizedBox(height: 8),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     'Rekomendasi Produk',
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w700,
            //       height: 0,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 8),
            // GridView(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2, crossAxisSpacing: 16),
            //   children: [
            //     TestMarketInvItemBox(
            //         imageasset: 'assets/bawang.png',
            //         title: "Bawang Sembrani",
            //         tanggal: "31 Dec 2024",
            //         harga: "Rp12.000"),
            //     TestMarketInvItemBox(
            //         imageasset: 'assets/bawang.png',
            //         title: "Bawang Sembrani",
            //         tanggal: "31 Dec 2024",
            //         harga: "Rp12.000")
            //   ],
            // ),
            widget.role == 'pasar'
                ? DashboardBox(
                    isOverview: true,
                    id: widget.id,
                  )
                : SizedBox(),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.user.role == 'petani'
                    ? 'Produk anda di Pasar ini'
                    : 'Produk yang tersedia',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 8),
            FutureBuilder(
                future: widget.user.role == 'petani'
                    ? ItemService()
                        .getPetaniItemsfromUser(widget.id!, widget.user.id!)
                    : ItemService().getItemsByUser(widget.id!),
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
                        return OverviewMarketItemBox(
                          user: widget.user,
                          imageasset: 'assets/bawang.png',
                          title: item.itemName,
                          tanggal: item.tanggalPanen,
                          harga: item.price,
                          item: item,
                          voidCallback: () {
                            widget.voidCallback!();
                          },
                        );
                      },
                    );
                  }
                })
          ]),
        ),
      ),
    );
  }
}
