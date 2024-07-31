import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';

class DashboardItemBox extends StatelessWidget {
  final String imageasset;
  final String title;
  final DateTime tanggal;
  // final String asalpanen;

  const DashboardItemBox({
    Key? key,
    required this.imageasset,
    required this.title,
    required this.tanggal,
    // required this.asalpanen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 208,
        height: 128,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.black.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8)),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imageasset),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8)),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        height: 70,
                        color: Colors.black.withOpacity(0.45),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tanggal Pembelian',
                            style: TextStyle(
                              color: AppTheme.passiveColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // Text(
                          //   'Asal Panen:',
                          //   style: TextStyle(
                          //     color: AppTheme.passiveColor,
                          //     fontSize: 10,
                          //     fontWeight: FontWeight.w400,
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${tanggal.toLocal()}'.split(' ')[0],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          // Text(
                          //   asalpanen,
                          //   style: TextStyle(
                          //     color: Colors.black,
                          //     fontSize: 10,
                          //     fontWeight: FontWeight.w700,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
