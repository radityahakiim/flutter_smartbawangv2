import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/state/page/cari_user/group_by_city_page.dart';

class KotaItemBox extends StatefulWidget {
  final String kota;
  final String avgHarga;
  const KotaItemBox({super.key, required this.kota, required this.avgHarga});

  @override
  State<KotaItemBox> createState() => _KotaItemBoxState();
}

class _KotaItemBoxState extends State<KotaItemBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 50,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GroupByCityPage()),
            );
          },
          borderRadius: BorderRadius.circular(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.kota,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              Text(
                'Avg. Harga di kota',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
              Text(
                widget.avgHarga,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
