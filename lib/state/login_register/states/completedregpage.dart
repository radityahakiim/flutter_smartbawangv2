import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:gif/gif.dart';

class CompletedRegPage extends StatefulWidget {
  final VoidCallback goToLoginPage;
  const CompletedRegPage({super.key, required this.goToLoginPage});

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
        const SizedBox(height: 40),
        const Text(
          'Daftar Berhasil!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Akun Anda telah terdaftar. Masuk sekarang untuk menggunakan aplikasi',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF818181),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 300,
          height: 300,
          child: Gif(
              controller: controller,
              autostart: Autostart.once,
              image: const AssetImage('assets/completed.gif')),
        ),
        const SizedBox(height: 20),
        CustomButton(text: "Masuk Sekarang", onPressed: widget.goToLoginPage)
      ],
    );
  }
}
