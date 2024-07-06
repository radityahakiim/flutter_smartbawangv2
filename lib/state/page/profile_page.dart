import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/auth/auth_controller.dart';
import 'package:flutter_smartbawangv2/db_local/auth/auth_service.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/intro.dart';
import 'package:flutter_smartbawangv2/state/login_register/states/loginpage.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:provider/provider.dart';

class ProfileMenuPage extends StatefulWidget {
  final User user;
  const ProfileMenuPage({super.key, required this.user});

  @override
  State<ProfileMenuPage> createState() => _ProfileMenuPage();
}

class _ProfileMenuPage extends State<ProfileMenuPage> {
  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profil Saya",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 0.07,
            letterSpacing: -0.34,
          ),
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            22.5), // Half of the width/height to make it circular
                      ),
                    ),
                    child: ClipOval(child: Icon(Icons.person)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.user.namaLengkap,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          Text(
                            widget.user.email,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.54),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            widget.user.nomorHp,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.54),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ]),
                  )
                ],
              ),
              SizedBox(height: 8),
              CustomButton(
                text: 'Logout',
                onPressed: () {
                  authService.logout();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const IntroPage()),
                      (Route<dynamic> route) => false);
                },
                isWhiteButton: true,
              )
            ],
          )),
    );
  }
}

// Custom button for logout purposes
          // child: CustomButton(
          //     text: "Logout",
          //     onPressed: () {
          
          //     })