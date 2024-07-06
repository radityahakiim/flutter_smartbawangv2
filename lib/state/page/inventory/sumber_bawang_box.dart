import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/state/materials/button.dart';

class SumberBawangBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6),
          height: 80,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1, color: Colors.black.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(10))),
          child: Column(children: [
            SizedBox(height: 4),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sumber Bawang",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      child: ClipOval(
                        child: Image.asset(
                          'assets/fotosawah.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sawah A',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.pin_drop, size: 12),
                                SizedBox(width: 6),
                                Text("Brebes, Jawa Tengah",
                                    style: TextStyle(fontSize: 10))
                              ],
                            ),
                          ]),
                    )
                  ],
                ),
                CustomButton(
                    text: "Kunjungi Lapak",
                    onPressed: () {},
                    isCustomSize: true,
                    custHeight: 40,
                    custWidth: 130)
              ],
            )
          ]),
        ),
      ],
    );
  }
}
