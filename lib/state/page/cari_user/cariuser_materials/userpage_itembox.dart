import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';

class CariPetaniItemBox extends StatefulWidget {
  final String imageasset;
  final String title;
  final String tempat;
  final VoidCallback onPressed;
  final User user;

  const CariPetaniItemBox({
    Key? key,
    required this.imageasset,
    required this.title,
    required this.tempat,
    required this.onPressed,
    required this.user,
  }) : super(key: key);

  @override
  State<CariPetaniItemBox> createState() => _CariPetaniItemBoxState();
}

class _CariPetaniItemBoxState extends State<CariPetaniItemBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        height: 102,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppTheme.passiveColor),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
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
                        padding: EdgeInsets.all(8),
                        width: 180,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.45),
                          image: DecorationImage(
                            image: AssetImage(widget.imageasset),
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
                            //EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                            EdgeInsets.all(10),
                        height: 70,
                        color: Colors.black.withOpacity(0.45),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              widget.title,
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
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 8),
                        Icon(Icons.pin_drop, size: 12),
                        SizedBox(width: 10),
                        FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(widget.tempat,
                                style: TextStyle(fontSize: 10)))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
