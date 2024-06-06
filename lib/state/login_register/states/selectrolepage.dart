import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:flutter_smartbawangv2/state/materials/textbox.dart';

class SelectRolePage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrev;
  const SelectRolePage({super.key, required this.onNext, required this.onPrev});

  @override
  State<SelectRolePage> createState() => _SelectRolePage();
}

class _SelectRolePage extends State<SelectRolePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Text(
          'Pilih posisi/role',
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
            textboxDesc: "Gabung Sebagai",
            textboxHint: "Pilih Posisi",
            isDdFormField: true,
            dropdownItems: ["Pengepul"]),
        SizedBox(height: 30),
        CustomButton(text: "Lanjut", onPressed: widget.onNext),
        SizedBox(height: 10),
        CustomButton(
            text: "Balik", onPressed: widget.onPrev, isWhiteButton: true),
      ],
    );
  }
}
