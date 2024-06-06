import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class VerifPhonePage extends StatefulWidget {
  final VoidCallback onPrev;
  final VoidCallback onNext;
  const VerifPhonePage({super.key, required this.onPrev, required this.onNext});

  @override
  State<VerifPhonePage> createState() => _VerifPhonePage();
}

class _VerifPhonePage extends State<VerifPhonePage> {
  bool _onEditing = true;
  String? _code;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Text(
          'Verifikasi Nomor Telepon',
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
          'Kode verifikasi akan dikirim ke nomor ',
          style: TextStyle(
            color: Colors.black.withOpacity(0.5400000214576721),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 0.09,
          ),
        ),
        SizedBox(height: 18),
        Text(
          '08********7890',
          style: TextStyle(
            color: Color(0xFF3B3B3B),
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 0.09,
          ),
        ),
        SizedBox(height: 10),
        VerificationCode(
          textStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).primaryColor),
          keyboardType: TextInputType.number,
          underlineColor: Colors
              .amber, // If this is null it will use primaryColor: Colors.red from Theme
          length: 4,
          cursorColor:
              Colors.blue, // If this is null it will default to the ambient
          // clearAll is NOT required, you can delete it
          // takes any widget, so you can implement your design
          clearAll: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'clear all',
              style: TextStyle(
                  fontSize: 14.0,
                  decoration: TextDecoration.underline,
                  color: Colors.blue[700]),
            ),
          ),
          margin: const EdgeInsets.all(12),
          onCompleted: (String value) {
            setState(() {
              _code = value;
            });
          },
          onEditing: (bool value) {
            setState(() {
              _onEditing = value;
            });
            if (!_onEditing) FocusScope.of(context).unfocus();
          },
        ),
        SizedBox(height: 20),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Belum menerima kode? ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: -0.34,
                ),
              ),
              TextSpan(
                text: 'Kirim ulang',
                style: TextStyle(
                  color: Color(0xFF00A3FF),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: -0.34,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(
                text: ' atau ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: -0.34,
                ),
              ),
              TextSpan(
                text: 'ganti nomor telepon',
                style: TextStyle(
                  color: Color(0xFF00A3FF),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: -0.34,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 50),
        CustomButton(text: "Lanjut", onPressed: widget.onNext),
        SizedBox(height: 10),
        CustomButton(
            text: "Balik", onPressed: widget.onPrev, isWhiteButton: true)
      ],
    );
  }
}
