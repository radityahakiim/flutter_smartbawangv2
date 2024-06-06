// Page detail Supply

import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';

class DetailSupplyPage extends StatefulWidget {
  const DetailSupplyPage({super.key});

  State<DetailSupplyPage> createState() => _DetailSupplyPage();
}

class _DetailSupplyPage extends State<DetailSupplyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Detail Supply",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 0.07,
            letterSpacing: -0.34,
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: 356,
        padding: EdgeInsets.all(6),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ID Supply',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
              Text(
                '#12345678',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal Supply',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
              Text(
                '12 Dec 2024',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nama Produk',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
              Text(
                'Bawang Bima Brebes',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Asal Produk',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
              Text(
                'Brebes, Jawa Tengah',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nama Petani',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
              Text(
                'Petani Brebes',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Harga / kg',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
              Text(
                'Rp12.000/kg',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Supply yang bertambah',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
              Text(
                '2.000kg',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Supply',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
              Text(
                '10.000kg',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status Supply',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
              Text(
                'Selesai',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal Supply Selesai',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
              Text(
                '12 Dec 2024',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 0.08,
                  letterSpacing: -0.17,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
