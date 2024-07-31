import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/auth/auth_controller.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/capitalize_string.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:flutter_smartbawangv2/state/materials/textbox.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RoleFormPage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrev;
  final VoidCallback ifFail;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey;
  const RoleFormPage(
      {super.key,
      required this.onNext,
      required this.onPrev,
      required this.scaffoldKey,
      required this.ifFail});

  @override
  State<RoleFormPage> createState() => _RoleFormPage();
}

class _RoleFormPage extends State<RoleFormPage> {
  bool isLoading = false;

  final List<Map<String, String>> dropdownItemsProvince = [
    {"display": "Jawa Tengah", "value": "jateng"},
  ];

  final List<Map<String, String>> dropdownItemsCity = [
    {"display": "Boyolali", "value": "boyolali"},
    {"display": "Brebes", "value": "brebes"},
    {"display": "Demak", "value": "demak"},
    {"display": "Kendal", "value": "kendal"},
    {"display": "Tegal", "value": "tegal"},
    {"display": "Temanggung", "value": "temanggung"},
    {"display": "Pati", "value": "pati"},
  ];

  File? _imageFile;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> lastValidateandRegister() async {
    // final controller = AuthController();
    final controller = Provider.of<AuthController>(context, listen: false);
    setState(() {
      isLoading = true;
    });

    try {
      final namaBisnis = controller.namaBisnisController.text;
      final alamatBisnis = controller.alamatBisnisController.text;

      if (namaBisnis.isEmpty || alamatBisnis.isEmpty) {
        throw ("Semua form wajib diisi");
      } else if (!controller.isProvinceSelected()) {
        throw ("Pilih provinsi salah satu");
      } else if (!controller.isCitySelected()) {
        throw ("Pilih kota salah satu");
      } else {
        User? user = await controller.register(context, widget.scaffoldKey);
        if (user != null) {
          widget.onNext();
        } else {
          widget.ifFail();
        }
      }
    } catch (e) {
      final snackBar = SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      );
      widget.scaffoldKey.currentState?.showSnackBar(snackBar);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    return Column(
      children: [
        const SizedBox(height: 40),
        Text(
          'Daftar ${capitalize(authController.selectedRole!)}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        const SizedBox(height: 26),
        CustomTextBox(
          textboxDesc: "Nama Bisnis",
          textboxHint: "Masukkan nama Bisnis",
          controller: authController.namaBisnisController,
        ),
        const SizedBox(height: 14),
        CustomTextBox(
          textboxDesc: "Alamat",
          textboxHint: "Masukkan alamat",
          controller: authController.alamatBisnisController,
        ),
        const SizedBox(height: 14),
        CustomTextBox(
          textboxDesc: "Provinsi",
          textboxHint: "Pilih Provinsi",
          isDdFormField: true,
          dropdownItems: dropdownItemsProvince,
          selectedItem: authController.selectedProvince,
          onChanged: (value) {
            authController.setSelectedProvince(value);
          },
        ),
        const SizedBox(height: 14),
        CustomTextBox(
          textboxDesc: "Kota",
          textboxHint: "Pilih Kota",
          isDdFormField: true,
          dropdownItems: dropdownItemsCity,
          selectedItem: authController.selectedCity,
          onChanged: (value) {
            authController.setSelectedCity(value);
          },
        ),
        const SizedBox(height: 14),
        const Align(
          alignment: Alignment.centerLeft,
          child: Row(children: [
            Text(
              'Foto Warehouse   ',
              style: TextStyle(
                color: Color(0xFF393939),
                fontSize: 14,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(width: 8),
            Text(
              'Max 2MB',
              style: TextStyle(
                color: Color(0xFF818181),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(height: 10),
          ]),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
                width: 82,
                height: 82,
                decoration: ShapeDecoration(
                    color: const Color(0xFFFFF9FF),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: AppTheme.primaryColor),
                        borderRadius: BorderRadius.circular(8))),
                child: Stack(
                  children: [
                    if (_imageFile != null)
                      Image.file(
                        _imageFile!,
                        width: 82,
                        height: 82,
                        fit: BoxFit.cover,
                      )
                    else
                      const Center(
                        child: Icon(
                          Icons.add,
                          color: AppTheme.primaryColor,
                          size: 30,
                        ),
                      )
                  ],
                )),
          ),
        ),
        const SizedBox(height: 16),
        if (isLoading)
          const CircularProgressIndicator()
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                  text: "Balik",
                  onPressed: widget.onPrev,
                  isWhiteButton: true,
                  isCustomSize: true,
                  custWidth: 150),
              CustomButton(
                  text: "Lanjut",
                  onPressed: () async {
                    lastValidateandRegister();
                  },
                  isCustomSize: true,
                  custWidth: 150)
            ],
          ),
      ],
    );
  }
}
