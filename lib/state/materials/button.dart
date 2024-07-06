import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isWhiteButton;
  final bool isCustomSize;
  final VoidCallback onPressed;
  final double? custWidth;
  final double? custHeight;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isWhiteButton = false,
      this.isCustomSize = false,
      this.custWidth,
      this.custHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double defaultButtonWidth = MediaQuery.of(context).size.width;
    if (isWhiteButton) {
      return Container(
        constraints: isCustomSize
            ? BoxConstraints(
                minWidth: custWidth ?? double.infinity,
                minHeight: custHeight ?? 45.67)
            : const BoxConstraints(minWidth: double.infinity, minHeight: 45.67),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Background color
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: AppTheme.primaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            shadowColor: const Color(0x26000000), // Shadow color
            elevation: 3, // Shadow elevation
            // minimumSize: isCustomSize
            //     ? Size(custWidth ?? 0, custHeight ?? 45.67)
            //     : Size(0, 45.67),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              color: AppTheme.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
      );
    }
    return Container(
      constraints: isCustomSize
          ? BoxConstraints(
              minWidth: custWidth ?? double.infinity,
              minHeight: custHeight ?? 45.67)
          : const BoxConstraints(minWidth: double.infinity, minHeight: 45.67),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF78287E), // Background color
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          shadowColor: const Color(0x26000000), // Shadow color
          elevation: 3, // Shadow elevation
          // minimumSize: Size(
          //     isCustomSize
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
    );
  }
}
