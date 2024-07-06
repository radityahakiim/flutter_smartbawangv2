import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/auth/auth_controller.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/main_navigation.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:flutter_smartbawangv2/state/materials/textbox.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onNext;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey;
  const LoginPage({super.key, required this.onNext, required this.scaffoldKey});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    Future<bool> validateLogin() async {
      try {
        final loginEmailorPhone = authController.loginEmailPhoneController.text;
        final loginPassword = authController.loginPasswordController.text;

        if (loginEmailorPhone.isEmpty || loginPassword.isEmpty) {
          throw ('Masukkan email/nomor telpon dan password!');
        }
        return true;
      } catch (error) {
        final snackBar = (SnackBar(
          backgroundColor: Colors.red,
          content: Text(error.toString()),
        ));
        widget.scaffoldKey.currentState?.showSnackBar(snackBar);
        return false;
      }
    }

    return Column(children: [
      const SizedBox(height: 40),
      const Text(
        'Login',
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
          textboxDesc: "Email / No Handphone",
          textboxHint: "Masukkan email/No handphone",
          controller: authController.loginEmailPhoneController),
      const SizedBox(height: 14),
      CustomTextBox(
          textboxDesc: "Kata Sandi",
          textboxHint: "Masukkan kata sandi",
          controller: authController.loginPasswordController,
          isPassword: true),
      const SizedBox(height: 14),
      Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {},
            child: const Text(
              'Lupa kata sandi?',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          )),
      const SizedBox(height: 40),
      CustomButton(
        text: "Masuk",
        onPressed: () async {
          bool isValid = await validateLogin();
          if (isValid) {
            User? user = await authController.login();
            if (user != null) {
              if (!mounted) return;
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => MainPage(
                          user: user, scaffoldkey: widget.scaffoldKey)),
                  (Route<dynamic> route) => false);
            } else {
              widget.scaffoldKey.currentState?.showSnackBar(const SnackBar(
                  content: Text(
                      "Email/nomor telepon tidak tersedia atau password salah")));
            }
          }
        },
      ),
      const SizedBox(height: 14),
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
                text: 'Klik untuk daftar',
                style: const TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
                recognizer: TapGestureRecognizer()..onTap = widget.onNext),
          ],
        ),
      ),
    ]);
  }
}
