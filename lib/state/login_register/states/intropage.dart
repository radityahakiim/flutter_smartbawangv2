import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';

class IntroState extends StatelessWidget {
  final VoidCallback onNext;

  const IntroState({super.key, required this.onNext});

  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 92),
      SizedBox(
        width: 322.92,
        height: 279.12,
        child: Image.asset('assets/intro.png'),
      ),
      const SizedBox(height: 55.29),
      const Text(
        'Kesejahteraan\nPetani Bawang',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF3B3B3B),
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
      Text(
        'Membantu kesejahteraan petani bawang\nmenstabilkan jumlah panen \n',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black.withOpacity(0.5400000214576721),
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 0,
          letterSpacing: -0.13,
        ),
      ),
      SizedBox(height: 47),
      CustomButton(
        text: "Mulai Sekarang",
        onPressed: onNext,
      )
    ]);
  }
}
