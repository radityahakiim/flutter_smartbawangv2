/// Halaman untuk Statistik
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/page/statistic_and_records/statisticpage_materials/record_supply_item.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  State<StatisticPage> createState() => _StatisticPage();
}

class _StatisticPage extends State<StatisticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 68,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        title: Text(
          "Statistik Pengepul",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 0.07,
            letterSpacing: -0.34,
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Diagram Stock Bawang (Sawah Daerah A)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 144,
            padding:
                const EdgeInsets.only(top: 8, left: 4, right: 3, bottom: 8),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.20000000298023224),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Diagram Stock Bawang (Pasar Daerah A)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 144,
            padding:
                const EdgeInsets.only(top: 8, left: 4, right: 3, bottom: 8),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.20000000298023224),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Record Supply',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            InkWell(
              onTap: () {},
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
          ]),
          SizedBox(
            height: 8,
          ),
          RecordSupplyItemBox(
              namapetani: "Petani Bawang Brebes",
              namaproduk: "Bawang Bima Brebes",
              status: "Selesai",
              tanggal: "31 Dec 2021",
              harga: "Rp12.000.000",
              supplybertambah: "2.000kg",
              totalsupply: "10.000kg")
        ]),
      ),
    );
  }
}
