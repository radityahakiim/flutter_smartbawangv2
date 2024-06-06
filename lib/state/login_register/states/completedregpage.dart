import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/state/main_navigation.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:gif/gif.dart';

class CompletedRegPage extends StatefulWidget {
  const CompletedRegPage({super.key});

  @override
  State<CompletedRegPage> createState() => _CompletedRegPage();
}

class _CompletedRegPage extends State<CompletedRegPage>
    with SingleTickerProviderStateMixin {
  late GifController controller;

  @override
  void initState() {
    super.initState();
    controller = GifController(vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Text(
          'Daftar Berhasil!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Akun Anda telah terdaftar. Masuk sekarang untuk menggunakan aplikasi',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF818181),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 300,
          height: 300,
          child: Gif(
              controller: controller,
              autostart: Autostart.once,
              image: AssetImage('assets/completed.gif')),
        ),
        SizedBox(height: 20),
        CustomButton(
            text: "Masuk Sekarang",
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MainPage()),
                  (Route<dynamic> route) => false);
            })
      ],
    );
  }
}
