/// Halaman untuk Statistik
import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/capitalize_string.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/page/statistic_and_records/statisticpage_materials/record_supply_item.dart';
import 'package:flutter_smartbawangv2/state/page/statistic_and_records/statisticpage_materials/statistic_box.dart';

class StatisticPage extends StatefulWidget {
  final User user;
  const StatisticPage({super.key, required this.user});

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
          "Statistik ${capitalize(widget.user.role)}",
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
          StatisticBox(user: widget.user),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(height: 8),
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
