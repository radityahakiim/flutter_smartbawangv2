import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/page/cari_petani.dart';
import 'package:flutter_smartbawangv2/state/page/inventory_materials/inventory_itembox.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: Text(
          'Warehouse Anda',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Container(
            height: 32,
            margin: EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: Color(0xFFEFEFEF),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Produk di warehouse Anda",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CariPetaniPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Cari Petani',
                      style: TextStyle(
                        color: AppTheme.colorBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    height: 28,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF78287E)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Terjual",
                        style: TextStyle(
                          color: Color(0xFF78287E),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    height: 28,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF78287E)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Belum Terjual",
                        style: TextStyle(
                          color: Color(0xFF78287E),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InventoryItemBox(
                    imageasset: 'assets/bawang.png',
                    title: "Bawang Sembrani",
                    tanggal: "31 Dec 2021",
                    harga: "Rp12.000",
                  ),
                  InventoryItemBox(
                    imageasset: 'assets/bawang.png',
                    title: "Bawang Sembrani",
                    tanggal: "31 Dec 2021",
                    harga: "Belum Terjual",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
