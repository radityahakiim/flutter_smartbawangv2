import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/db_helper.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/capitalize_string.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/searchbox.dart';
// import 'package:flutter_smartbawangv2/state/page/cari_user/cariuser_materials/kota_itembox.dart';
import 'package:flutter_smartbawangv2/state/page/cari_user/cariuser_materials/userpage_itembox.dart';
import 'package:flutter_smartbawangv2/state/page/cari_user/market_overview_page.dart';

class GroupByCityPage extends StatefulWidget {
  final String kota;
  final String role;
  final String prov;
  final User user;
  const GroupByCityPage(
      {super.key,
      required this.kota,
      required this.role,
      required this.prov,
      required this.user});

  @override
  State<GroupByCityPage> createState() => _GroupByCityPage();
}

class _GroupByCityPage extends State<GroupByCityPage> {
  String secondTitle(String role) {
    switch (role) {
      case 'pasar':
        return 'pasar';
      case 'petani':
        return 'sawah';
      case 'pengepul':
        return 'warehouse';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "${capitalize(widget.kota)}, ${widget.prov}",
            style: const TextStyle(
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
                const SizedBox(height: 8),
                CustSearchBox(),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cari ${secondTitle(widget.role)} di ${capitalize(widget.kota)}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                FutureBuilder<List<Map<String, dynamic>>>(
                    future: DBHelper.db
                        .getUsersByKotaAndRole(widget.kota, widget.role),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No users found'));
                      } else {
                        return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final user = snapshot.data![index];
                            return CariPetaniItemBox(
                              imageasset: 'assets/fotosawah.png',
                              title: user['namaBisnis'],
                              tempat: user['alamatBisnis'],
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            MarketOverviewPage(
                                                voidCallback: () {},
                                                user: widget.user,
                                                id: user['id'],
                                                namaBisnis: user['namaBisnis'],
                                                alamatBisnis:
                                                    user['alamatBisnis'],
                                                kota: user['kota'],
                                                prov: user['provinsi'],
                                                role: user['role']))));
                              },
                              user: widget.user,
                            );
                          },
                        );
                      }
                    })
              ],
            )));
  }
}
