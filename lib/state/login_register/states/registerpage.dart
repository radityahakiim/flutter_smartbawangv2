import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:flutter_smartbawangv2/state/materials/textbox.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrev;
  const RegisterPage({super.key, required this.onNext, required this.onPrev});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(
            'Daftar Akun',
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
              textboxDesc: "Nama Lengkap",
              textboxHint: "Masukkan Nama Lengkap"),
          SizedBox(height: 14),
          CustomTextBox(
              textboxDesc: "Nomor Handphone",
              textboxHint: "Masukkan nomor handphone",
              isNumber: true),
          SizedBox(height: 14),
          CustomTextBox(textboxDesc: "Email", textboxHint: "Masukkan email"),
          SizedBox(height: 14),
          CustomTextBox(
            textboxDesc: "Kata Sandi",
            textboxHint: "Masukkan kata sandi",
            isPassword: true,
          ),
          SizedBox(height: 14),
          CustomTextBox(
            textboxDesc: "Konfirmasi Kata Sandi",
            textboxHint: "Masukan ulang kata sandi",
            isPassword: true,
          ),
          SizedBox(height: 40),
          CustomButton(text: "Daftar", onPressed: widget.onNext),
          SizedBox(height: 14),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Sudah memiliki akun?',
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
                    text: 'Klik untuk masuk',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = widget.onPrev),
              ],
            ),
          ),
          SizedBox(height: 56)
        ],
      ),
    );
  }
}
