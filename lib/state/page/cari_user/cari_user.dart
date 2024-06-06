import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/searchbox.dart';
import 'package:flutter_smartbawangv2/state/page/cari_user/cariuser_materials/kota_itembox.dart';
import 'package:flutter_smartbawangv2/state/page/cari_user/cariuser_materials/userpage_itembox.dart';
import 'package:flutter_smartbawangv2/state/page/cari_user/market_overview_page.dart';

class CariUser extends StatefulWidget {
  const CariUser({super.key});

  @override
  State<CariUser> createState() => _CariUser();
}

class _CariUser extends State<CariUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Cari Petani",
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            SizedBox(height: 8),
            CustSearchBox(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Petani terakhir',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Cari Pasar',
                    style: TextStyle(
                      color: AppTheme.colorBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CariPetaniItemBox(
                    imageasset: 'assets/fotosawah.png',
                    title: "Sawah A",
                    tempat: 'Brebes, Jawa Tengah',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  MarketOverviewPagePage())));
                    }),
                CariPetaniItemBox(
                  imageasset: 'assets/fotosawah.png',
                  title: "Sawah A",
                  tempat: 'Brebes, Jawa Tengah',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => MarketOverviewPagePage())));
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pilih kota dengan pertanian bawang',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 8),
            KotaItemBox(
              kota: 'Brebes, Jawa Tengah',
              avgHarga: "Rp12.000",
            )
          ],
        ),
      ),
    );
  }
}
