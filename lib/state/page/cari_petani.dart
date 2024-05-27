import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';

class CariPetaniPage extends StatefulWidget {
  const CariPetaniPage({super.key});

  @override
  State<CariPetaniPage> createState() => _CariPetaniPage();
}

class _CariPetaniPage extends State<CariPetaniPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cari Petani",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 0.07,
            letterSpacing: -0.34,
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
    );
  }
}
