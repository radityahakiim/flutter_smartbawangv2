import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';
import 'package:flutter_smartbawangv2/state/materials/textbox.dart';
import 'package:image_picker/image_picker.dart';

class RoleFormPage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrev;
  const RoleFormPage({super.key, required this.onNext, required this.onPrev});

  @override
  State<RoleFormPage> createState() => _RoleFormPage();
}

class _RoleFormPage extends State<RoleFormPage> {
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

  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Text(
          'Daftar Pengepul',
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
            textboxDesc: "Nama Warehouse",
            textboxHint: "Masukkan nama Warehouse"),
        SizedBox(height: 14),
        CustomTextBox(textboxDesc: "Alamat", textboxHint: "Masukkan alamat"),
        SizedBox(height: 14),
        CustomTextBox(
            textboxDesc: "Provinsi",
            textboxHint: "Pilih Provinsi",
            isDdFormField: true,
            dropdownItems: ["Jawa Tengah"]),
        SizedBox(height: 14),
        CustomTextBox(
          textboxDesc: "Kota",
          textboxHint: "Pilih Kota",
          isDdFormField: true,
          dropdownItems: ["Brebes"],
        ),
        SizedBox(height: 14),
        Align(
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
                    color: Color(0xFFFFF9FF),
                    shape: RoundedRectangleBorder(
                        side:
                            BorderSide(width: 1, color: AppTheme.primaryColor),
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
                      Center(
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
        SizedBox(height: 16),
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
                onPressed: widget.onNext,
                isCustomSize: true,
                custWidth: 150)
          ],
        ),
      ],
    );
  }
}
