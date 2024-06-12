import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';

class CustomTextBox extends StatefulWidget {
  final String textboxDesc;
  final String textboxHint;
  final bool isPassword;
  final bool isNumber;
  final bool isDdFormField;
  final bool isCustomSize;
  final double? custWidth;
  final double? custHeight;
  final List<Map<String, String>>? dropdownItems;
  final String? selectedItem;
  final ValueChanged<String?>? onChanged;
  final TextEditingController? controller;

  const CustomTextBox({
    Key? key,
    required this.textboxDesc,
    required this.textboxHint,
    this.isPassword = false,
    this.isNumber = false,
    this.isDdFormField = false,
    this.dropdownItems,
    this.isCustomSize = false,
    this.custWidth,
    this.custHeight,
    this.controller,
    this.selectedItem,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  bool _isObscured = true;
  // String? _selectedItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.textboxDesc,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
        SizedBox(height: 4),
        Container(
          width: widget.isCustomSize ? (widget.custWidth ?? 325) : 325,
          height: widget.isCustomSize ? (widget.custHeight ?? 47) : 47,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: ShapeDecoration(
            color: Color(0x19FAC1FF),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: AppTheme.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: widget.isDdFormField
              ? DropdownButtonFormField<String>(
                  value: widget.selectedItem,
                  hint: _ddformText(
                    text: widget.textboxHint,
                  ),
                  items: widget.dropdownItems?.map((Map<String, String> item) {
                    return DropdownMenuItem<String>(
                      value: item["value"],
                      child: _ddformText(
                        text: item["display"]!,
                      ),
                    );
                  }).toList(),
                  onChanged: widget.onChanged,
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: widget.controller,
                        obscureText: widget.isPassword ? _isObscured : false,
                        keyboardType: widget.isNumber
                            ? TextInputType.number
                            : TextInputType.text,
                        inputFormatters: widget.isNumber
                            ? [FilteringTextInputFormatter.digitsOnly]
                            : [],
                        decoration: InputDecoration(
                          hintText: widget.textboxHint,
                          hintStyle: TextStyle(
                            color: AppTheme.passiveColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                          suffixIcon: widget.isPassword
                              ? IconButton(
                                  icon: Icon(_isObscured
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscured = !_isObscured;
                                    });
                                  },
                                )
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}

class _ddformText extends StatelessWidget {
  final String text;

  const _ddformText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
