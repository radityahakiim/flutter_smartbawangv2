import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:flutter_smartbawangv2/state/materials/textbox.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onNext;
  const LoginPage({super.key, required this.onNext});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Column(children: [
        SizedBox(height: 40),
        Text(
          'Login',
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
            textboxDesc: "Email / No Handphone",
            textboxHint: "Masukkan email/No handphone"),
        SizedBox(height: 14),
        CustomTextBox(
            textboxDesc: "Kata Sandi",
            textboxHint: "Masukkan kata sandi",
            isPassword: true),
        SizedBox(height: 14),
        Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {},
              child: Text(
                'Lupa kata sandi?',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            )),
        SizedBox(height: 40),
        CustomButton(text: "Masuk", onPressed: () {}),
        SizedBox(height: 14),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Belum memiliki akun?',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5400000214576721),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              TextSpan(
                text: ' ',
                style: TextStyle(
                  color: Color(0xFF78287E),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              TextSpan(
                  text: 'Klik untuk daftar',
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = widget.onNext),
            ],
          ),
        ),
      ]),
    );
  }
}
