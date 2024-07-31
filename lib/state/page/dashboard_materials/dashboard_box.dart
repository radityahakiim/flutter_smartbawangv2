import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/dashboard_service.dart';
import 'package:flutter_smartbawangv2/db_local/db_helper.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/rupiah_convert.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';

class DashboardBox extends StatefulWidget {
  final User? user;
  final bool? isOverview;
  final int? id;
  const DashboardBox({super.key, this.user, this.isOverview = false, this.id});

  @override
  State<DashboardBox> createState() => _DashboardBox();
}

class _DashboardBox extends State<DashboardBox> {
  int _totalQuantity = 0;
  double _maxPrice = 0.0;
  double _minPrice = 0.0;
  double _avgPrice = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchPricesandQt();
  }

  Future<void> _fetchPricesandQt() async {
    final db = await DBHelper.db.database;
    final DashboardService dashboardService = DashboardService();
    late final String targetKota;
    late final Map<String, dynamic> prices;
    late final int totalQuantity;
    if (widget.isOverview == false) {
      if (widget.user!.role == 'pengepul' || widget.user!.role == 'petani') {
        targetKota = widget.user!.kota;
        prices = await dashboardService.getPricesFromPasar(db, targetKota);
        totalQuantity =
            await dashboardService.sumQtOfItemsOwnedByPasar(db, targetKota);
      } else {
        prices = await dashboardService.getPriceDataForUser(widget.user!.id!);
        totalQuantity = await dashboardService.sumQtForUser(widget.user!.id!);
      }
    } else {
      prices = await dashboardService.getPriceDataForUser(widget.id!);
      totalQuantity = await dashboardService.sumQtForUser(widget.id!);
    }
    setState(() {
      _totalQuantity = totalQuantity;
      _maxPrice = prices['max_price'] ?? 0.0;
      _minPrice = prices['min_price'] ?? 0.0;
      _avgPrice = prices['avg_price'] ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xFFF0E1F2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nama Daerah',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${formatRupiah(_avgPrice)}/kg',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Harga Rata-rata',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Text(
                  formatRupiah(_avgPrice),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Harga Tertinggi',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Text(
                  formatRupiah(_maxPrice),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Harga Terendah',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Text(
                  formatRupiah(_minPrice),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 100,
              decoration: ShapeDecoration(
                color: Color(0xFFF9F9F9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Supply Bulan Ini',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Supply Tersedia",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "0kg",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${_totalQuantity.toString()}kg",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Status Supply",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Oversupply',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFFF0000),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
