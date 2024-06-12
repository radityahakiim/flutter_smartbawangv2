import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/auth/auth_controller.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:flutter_smartbawangv2/state/materials/textbox.dart';
import 'package:provider/provider.dart';

class SelectRolePage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrev;
  final GlobalKey<ScaffoldMessengerState> scaffoldkey;
  const SelectRolePage(
      {super.key,
      required this.onNext,
      required this.onPrev,
      required this.scaffoldkey});

  @override
  State<SelectRolePage> createState() => _SelectRolePage();
}

class _SelectRolePage extends State<SelectRolePage> {
  final List<Map<String, String>> dropdownItems = [
    {"display": "Petani", "value": "petani"},
    {"display": "Pasar", "value": "pasar"},
    {"display": "Pengepul", "value": "pengepul"},
  ];

  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  Future validateRole() async {
    final roleProvider = Provider.of<AuthController>(context, listen: false);
    try {
      if (roleProvider.isRoleSelected()) {
        widget.onNext();
      } else {
        throw ("Please select a role");
      }
    } catch (e) {
      widget.scaffoldkey.currentState?.showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final roleProvider = Provider.of<AuthController>(context);

    return Column(
      children: [
        const SizedBox(height: 40),
        const Text(
          'Pilih posisi/role',
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
          textboxDesc: "Gabung Sebagai",
          textboxHint: "Pilih Posisi",
          isDdFormField: true,
          dropdownItems: dropdownItems,
          selectedItem: roleProvider.selectedRole,
          onChanged: (value) {
            roleProvider.setSelectedRole(value);
          },
        ),
        const SizedBox(height: 30),
        CustomButton(text: "Lanjut", onPressed: widget.onNext),
        const SizedBox(height: 10),
        CustomButton(
            text: "Balik", onPressed: widget.onPrev, isWhiteButton: true),
      ],
    );
  }
}
