import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/state/login_register/states/completedregpage.dart';
import 'package:flutter_smartbawangv2/state/login_register/states/intropage.dart';
import 'package:flutter_smartbawangv2/state/login_register/states/loginpage.dart';
import 'package:flutter_smartbawangv2/state/login_register/states/registerpage.dart';
import 'package:flutter_smartbawangv2/state/login_register/states/roleformpage.dart';
import 'package:flutter_smartbawangv2/state/login_register/states/selectrolepage.dart';
// import 'package:flutter_smartbawangv2/state/login_register/states/verifphonepage.dart';
import 'package:flutter_smartbawangv2/state/logo.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({
    super.key,
  });

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  int _currentPage = 0;

  void _goToNextPage() {
    setState(() {
      _currentPage = (_currentPage + 1) % 6;
    });
  }

  void _gotoPrevPage() {
    setState(() {
      _currentPage = _currentPage - 1;
    });
  }

  void _goBackToFirstRegisterPage() {
    setState(() {
      _currentPage = 2;
    });
  }

  void _gotoLoginPage() {
    setState(() {
      _currentPage = 1;
    });
  }

  Widget _getSelectedPage(int page) {
    switch (page) {
      case 0:
        return IntroState(onNext: _goToNextPage);
      case 1:
        return LoginPage(
          onNext: _goToNextPage,
          scaffoldKey: _scaffoldKey,
        );
      case 2:
        return RegisterPage(
          onNext: _goToNextPage,
          onPrev: _gotoPrevPage,
          scaffoldkey: _scaffoldKey,
        );
      case 3:
        return SelectRolePage(
          onNext: _goToNextPage,
          onPrev: _gotoPrevPage,
          scaffoldkey: _scaffoldKey,
        );
      case 4:
        return RoleFormPage(
          onNext: _goToNextPage,
          onPrev: _gotoPrevPage,
          scaffoldKey: _scaffoldKey,
          ifFail: _goBackToFirstRegisterPage,
        );
      // case 5:
      //   return VerifPhonePage(
      //     onPrev: _gotoPrevPage,
      //     onNext: _goToNextPage,
      //   );
      case 5:
        return CompletedRegPage(goToLoginPage: _gotoLoginPage);
      default:
        return IntroState(onNext: _goToNextPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => _gotoPrevPage(),
      child: ScaffoldMessenger(
        key: _scaffoldKey,
        child: Scaffold(
          body: Center(
              child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  const CustomLogo(),
                  _getSelectedPage(_currentPage)
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
