import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/db_helper.dart';
import 'package:flutter_smartbawangv2/shared/capitalize_string.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/searchbox.dart';
import 'package:flutter_smartbawangv2/state/page/cari_user/cariuser_materials/kota_itembox.dart';
import 'package:flutter_smartbawangv2/state/page/cari_user/cariuser_materials/userpage_itembox.dart';
import 'package:flutter_smartbawangv2/state/page/cari_user/market_overview_page.dart';

class CariUser extends StatefulWidget {
  final String role;
  const CariUser({super.key, required this.role});

  @override
  State<CariUser> createState() => _CariUser();
}

class _CariUser extends State<CariUser> {
  late String role;
  late Future<List<Map<String, String>>>? kotaAndProvList;
  @override
  void initState() {
    super.initState();
    role = widget.role;
    kotaAndProvList = DBHelper.db.getKotaAndProvinsiListByRole(role);
  }

  void updateRole(String newRole) {
    setState(() {
      role = newRole;
      kotaAndProvList = DBHelper.db.getKotaAndProvinsiListByRole(role);
    });
  }

  @override
  Widget build(BuildContext context) {
    String capitalizedRole = capitalize(widget.role);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Cari $capitalizedRole",
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            const SizedBox(height: 8),
            CustSearchBox(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$capitalizedRole terakhir',
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
                    title: "Tes",
                    tempat: 'Lorem Ipsum dolor sit amet',
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => MarketOverviewPage())));
                    }),
                CariPetaniItemBox(
                  imageasset: 'assets/fotosawah.png',
                  title: "Tes",
                  tempat: 'Lorem Ipsum Dolor sit amet',
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: ((context) => MarketOverviewPage())));
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
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
            const SizedBox(height: 8),
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                  future: kotaAndProvList,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No city found.'));
                    } else {
                      return ListView.separated(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];
                          return KotaItemBox(
                            kota: item['kota']!,
                            prov: item['provinsi']!,
                            avgHarga: "Rp13.000",
                            role: role,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 12);
                        },
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
