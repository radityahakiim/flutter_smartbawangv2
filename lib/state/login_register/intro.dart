import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/state/login_register/states/intropage.dart';
import 'package:flutter_smartbawangv2/state/login_register/states/loginpage.dart';
import 'package:flutter_smartbawangv2/state/login_register/states/registerpage.dart';
import 'package:flutter_smartbawangv2/state/login_register/states/roleformpage.dart';
import 'package:flutter_smartbawangv2/state/login_register/states/selectrolepage.dart';
import 'package:flutter_smartbawangv2/state/logo.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _currentPage = 0;

  void _goToNextPage() {
    setState(() {
      _currentPage = (_currentPage + 1) % 5;
    });
  }

  void _gotoPrevPage() {
    setState(() {
      _currentPage = _currentPage - 1;
    });
  }

  Widget _getSelectedPage(int page) {
    switch (page) {
      case 0:
        return IntroState(onNext: _goToNextPage);
      case 1:
        return LoginPage(onNext: _goToNextPage);
      case 2:
        return RegisterPage(
          onNext: _goToNextPage,
          onPrev: _gotoPrevPage,
        );
      case 3:
        return SelectRolePage(onNext: _goToNextPage);
      case 4:
        return RoleFormPage(onNext: _goToNextPage);
      default:
        return IntroState(onNext: _goToNextPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            CustomLogo(),
            _getSelectedPage(_currentPage)
          ],
        ),
      )),
    );
  }
}
