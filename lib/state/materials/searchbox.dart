import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustSearchBox extends StatefulWidget {
  const CustSearchBox({super.key});

  @override
  State<CustSearchBox> createState() => _CustSearchBox();
}

class _CustSearchBox extends State<CustSearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Set your desired width
      height: 50, // Set your desired height
      decoration: BoxDecoration(
        color: Colors.grey[200], // Set your desired background color
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Search",
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide.none, // Remove border
          ),
        ),
      ),
    );
  }
}
