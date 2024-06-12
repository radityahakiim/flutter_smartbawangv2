import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/auth/auth_controller.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:flutter_smartbawangv2/state/materials/textbox.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrev;

  final GlobalKey<ScaffoldMessengerState> scaffoldkey;
  RegisterPage(
      {Key? key,
      required this.onNext,
      required this.onPrev,
      required this.scaffoldkey})
      : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AuthController>(context);

    Future _validateAndProceed() async {
      try {
        final namalengkap = _controller.namaLengkapController.text;
        final email = _controller.emailController.text;
        final nomorHp = _controller.nomorHpController.text;
        final password = _controller.passwordController.text;
        final confirmpassword = confirmPasswordController.text;

        if (namalengkap.isEmpty ||
            email.isEmpty ||
            nomorHp.isEmpty ||
            password.isEmpty) {
          throw ('Semua form wajib diisi');
        } else if (password.length < 8) {
          throw ('Password harus diisi setidaknya 8 karakter');
        } else if (!EmailValidator.validate(email)) {
          throw ("Isi email dengan benar!");
        } else if (confirmpassword != password) {
          throw ("Password dan konfirmasi harus sama!");
        } else {
          widget.onNext();
        }
      } catch (error) {
        final snackBar = (SnackBar(
          backgroundColor: Colors.red,
          content: Text(error.toString()),
        ));
        widget.scaffoldkey.currentState?.showSnackBar(snackBar);
      }
    }

    @override
    void initState() {
      super.initState();
      confirmPasswordController = TextEditingController();
    }

    @override
    void dispose() {
      confirmPasswordController.dispose();
      super.dispose();
    }

    void _showSnackBar(String message) {
      final snackBar = SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      );
      widget.scaffoldkey.currentState?.showSnackBar(snackBar);
    }

    return Column(
      children: [
        const SizedBox(height: 40),
        const Text(
          'Daftar Akun',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        const SizedBox(height: 26),
        CustomTextBox(
          textboxDesc: "Nama Lengkap",
          textboxHint: "Masukkan Nama Lengkap",
          controller: _controller.namaLengkapController,
        ),
        const SizedBox(height: 14),
        CustomTextBox(
          textboxDesc: "Nomor Handphone",
          textboxHint: "Masukkan nomor handphone",
          isNumber: true,
          controller: _controller.nomorHpController,
        ),
        const SizedBox(height: 14),
        CustomTextBox(
          textboxDesc: "Email",
          textboxHint: "Masukkan email",
          controller: _controller.emailController,
        ),
        const SizedBox(height: 14),
        CustomTextBox(
          textboxDesc: "Kata Sandi",
          textboxHint: "Masukkan kata sandi",
          isPassword: true,
          controller: _controller.passwordController,
        ),
        const SizedBox(height: 14),
        CustomTextBox(
          textboxDesc: "Konfirmasi Kata Sandi",
          textboxHint: "Masukan ulang kata sandi",
          isPassword: true,
          controller: confirmPasswordController,
        ),
        const SizedBox(height: 40),
        CustomButton(text: "Daftar", onPressed: _validateAndProceed),
        const SizedBox(height: 14),
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
              const TextSpan(
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
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = widget.onPrev),
            ],
          ),
        ),
        const SizedBox(height: 56)
      ],
    );
  }
}
