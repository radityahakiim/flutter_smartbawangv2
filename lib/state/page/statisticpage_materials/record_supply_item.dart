// Box untuk item record supply

import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/state/page/detail_supply_page.dart';

class RecordSupplyItemBox extends StatelessWidget {
  final String namapetani;
  final String namaproduk;
  final String status;
  final String tanggal;
  final String harga;
  final String supplybertambah;
  final String totalsupply;

  const RecordSupplyItemBox(
      {super.key,
      required this.namapetani,
      required this.namaproduk,
      required this.status,
      required this.tanggal,
      required this.harga,
      required this.supplybertambah,
      required this.totalsupply});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailSupplyPage()));
      },
      child: Container(
        width: 346,
        height: 120,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.black.withOpacity(0.20000000298023224),
            ),
            top: BorderSide(
              width: 1,
              color: Colors.black.withOpacity(0.20000000298023224),
            ),
            right: BorderSide(
              color: Colors.black.withOpacity(0.20000000298023224),
            ),
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.20000000298023224),
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 8,
              top: 11,
              child: Container(
                width: 55,
                height: 56.02,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/55x56"),
                    fit: BoxFit.cover,
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 84,
              top: 11,
              child: SizedBox(
                width: 178,
                height: 15,
                child: Text(
                  namapetani,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 84,
              top: 31,
              child: SizedBox(
                width: 169,
                height: 9,
                child: Text(
                  'Produk : $namaproduk',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              top: 78,
              child: SizedBox(
                width: 77,
                height: 8,
                child: Text(
                  'Harga',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              top: 91,
              child: SizedBox(
                width: 85,
                height: 9,
                child: Text(
                  harga,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 117,
              top: 77,
              child: SizedBox(
                width: 112,
                height: 8,
                child: Text(
                  'Supply yang bertambah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 130,
              top: 92,
              child: SizedBox(
                width: 85,
                height: 9,
                child: Text(
                  supplybertambah,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 229,
              top: 78,
              child: SizedBox(
                width: 112,
                height: 8,
                child: Text(
                  'Total Supply',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 256,
              top: 92,
              child: SizedBox(
                width: 85,
                height: 9,
                child: Text(
                  totalsupply,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 273,
              top: 10,
              child: SizedBox(
                width: 72,
                height: 9,
                child: Text(
                  tanggal,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 84,
              top: 45,
              child: SizedBox(
                width: 169,
                height: 10,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Status : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: status,
                        style: TextStyle(
                          color: Color(0xFF00AF26),
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
