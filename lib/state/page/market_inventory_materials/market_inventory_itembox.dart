import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/item_model.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/page/inventory/product_page.dart';
// import 'package:flutter_smartbawangv2/state/page/inventory/product_page_test.dart';
import 'package:flutter_smartbawangv2/shared/rupiah_convert.dart';

class MarketInvItemBox extends StatelessWidget {
  final Item item;
  final String imageasset;
  final String title;
  final DateTime tanggal;
  final double harga;
  final User user;
  final VoidCallback voidCallback;
  final GlobalKey<ScaffoldMessengerState> scaffoldkey;

  const MarketInvItemBox({
    Key? key,
    required this.imageasset,
    required this.title,
    required this.tanggal,
    required this.harga,
    required this.item,
    required this.voidCallback,
    required this.user,
    required this.scaffoldkey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        height: 160,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.black.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => InventoryProductPage(
                            item: item,
                            onRefresh: voidCallback,
                            user: user,
                            scaffoldKey: scaffoldkey,
                          ))));
            },
            borderRadius: BorderRadius.circular(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(8)),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imageasset),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            formatRupiah(harga),
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              height: 0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Tgl. Panen',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${tanggal.toLocal()}'.split(' ')[0],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
