import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/state/materials/textbox.dart';

class RoleFormPage extends StatefulWidget {
  final VoidCallback onNext;
  const RoleFormPage({super.key, required this.onNext});

  @override
  State<RoleFormPage> createState() => _RoleFormPage();
}

class _RoleFormPage extends State<RoleFormPage> {
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(
            'Daftar Pengepul',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          SizedBox(height: 26),
          CustomTextBox(
              textboxDesc: "Nama Warehouse",
              textboxHint: "Masukkan nama Warehouse"),
          SizedBox(height: 14),
          CustomTextBox(textboxDesc: "Alamat", textboxHint: "Masukkan alamat"),
          SizedBox(height: 14),
          CustomTextBox(
              textboxDesc: "Provinsi",
              textboxHint: "Pilih Provinsi",
              isDdFormField: true,
              dropdownItems: ["Jawa Tengah"]),
          SizedBox(height: 14),
          CustomTextBox(textboxDesc: "Kota", textboxHint: "Pilih Kota")
        ],
      ),
    );
  }
}
