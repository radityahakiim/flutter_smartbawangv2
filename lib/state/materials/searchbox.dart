import 'package:flutter/material.dart';

class CustSearchBox extends StatefulWidget {
  final TextEditingController? searchCtrl;
  const CustSearchBox({super.key, this.searchCtrl});

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
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      ),
      child: TextField(
        decoration: const InputDecoration(
          labelText: "Search",
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide.none, // Remove border
          ),
        ),
        controller: widget.searchCtrl,
      ),
    );
  }
}
