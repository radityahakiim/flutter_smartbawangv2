import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:flutter_smartbawangv2/state/materials/searchbox.dart';
// import 'package:flutter_smartbawangv2/state/page/market_inventory_materials/market_inventory_itembox.dart';
import 'package:flutter_smartbawangv2/state/page/market_inventory_materials/test_market_inv_itembox.dart';

class MarketOverviewPagePage extends StatefulWidget {
  const MarketOverviewPagePage({super.key});

  @override
  State<MarketOverviewPagePage> createState() => _MarketOverviewPagePage();
}

class _MarketOverviewPagePage extends State<MarketOverviewPagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Sawah A",
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
                          'Sawah A',
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
                            Text("Brebes, Jawa Tengah",
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
                    text: "Chat Petani",
                    onPressed: () {},
                    isCustomSize: true,
                    custHeight: 30,
                    custWidth: 160),
                CustomButton(
                    text: "Informasi Petani",
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Rekomendasi Produk',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(height: 8),
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 16),
              children: [
                TestMarketInvItemBox(
                    imageasset: 'assets/bawang.png',
                    title: "Bawang Sembrani",
                    tanggal: "31 Dec 2024",
                    harga: "Rp12.000"),
                TestMarketInvItemBox(
                    imageasset: 'assets/bawang.png',
                    title: "Bawang Sembrani",
                    tanggal: "31 Dec 2024",
                    harga: "Rp12.000")
              ],
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Produk Lainnya',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 8),
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 16),
              children: [
                TestMarketInvItemBox(
                    imageasset: 'assets/bawang.png',
                    title: "Bawang Sembrani",
                    tanggal: "31 Dec 2024",
                    harga: "Rp12.000"),
                TestMarketInvItemBox(
                    imageasset: 'assets/bawang.png',
                    title: "Bawang Sembrani",
                    tanggal: "31 Dec 2024",
                    harga: "Rp12.000"),
                TestMarketInvItemBox(
                    imageasset: 'assets/bawang.png',
                    title: "Bawang Sembrani",
                    tanggal: "31 Dec 2024",
                    harga: "Rp12.000"),
                TestMarketInvItemBox(
                    imageasset: 'assets/bawang.png',
                    title: "Bawang Sembrani",
                    tanggal: "31 Dec 2024",
                    harga: "Rp12.000")
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
