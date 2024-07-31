import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/stat_service.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:intl/intl.dart';

class StatisticBox extends StatefulWidget {
  final User user;

  const StatisticBox({super.key, required this.user});

  @override
  State<StatisticBox> createState() => _StatisticBox();
}

class _StatisticBox extends State<StatisticBox> {
  final StatService _statService = StatService();
  List<FlSpot> _chartData = [];

  @override
  void initState() {
    super.initState();
    if (widget.user.role == 'petani') {
      _fetchDataPetani();
    }
  }

  Future<void> _fetchDataPetani() async {
    final maps = await _statService.fetchWeeklyPetaniStat(widget.user.id!);

    DateTime now = DateTime.now();
    DateTime lastSunday = now.subtract(Duration(days: now.weekday));

    List<FlSpot> data = [];
    for (var i = 0; i < 7; i++) {
      DateTime day = lastSunday.add(Duration(days: i));
      String dayStr = DateFormat('yyyy-MM-dd').format(day);
      var dayData = maps.firstWhere((map) => map['tanggal_panen'] == dayStr,
          orElse: () => {'total_quantity': 0});
      data.add(
          FlSpot(i.toDouble(), (dayData['total_quantity'] as int).toDouble()));
    }

    setState(() {
      _chartData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.user.role == 'petani') {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Diagram Panen Bawang (Stok)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 144,
            // padding:
            //     const EdgeInsets.only(top: 8, left: 4, right: 3, bottom: 8),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.20000000298023224),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: _chartData.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LineChart(LineChartData(
                        titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  switch (value.toInt()) {
                                    case 0:
                                      return Text('Sun');
                                    case 1:
                                      return Text('Mon');
                                    case 2:
                                      return Text('Tue');
                                    case 3:
                                      return Text('Wed');
                                    case 4:
                                      return Text('Thu');
                                    case 5:
                                      return Text('Fri');
                                    case 6:
                                      return Text('Sat');
                                    default:
                                      return Text('');
                                  }
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: true))),
                        borderData: FlBorderData(show: true),
                        lineBarsData: [
                          LineChartBarData(
                              spots: _chartData,
                              isCurved: true,
                              barWidth: 4,
                              belowBarData: BarAreaData(show: true),
                              dotData: FlDotData(show: false))
                        ])),
                  ),
          ),
        ],
      );
    } else if (widget.user.role == 'pengepul') {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Diagram Stock Bawang (Sawah Daerah A)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 144,
            padding:
                const EdgeInsets.only(top: 8, left: 4, right: 3, bottom: 8),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.20000000298023224),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Diagram Stock Bawang (Pasar Daerah A)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 144,
            padding:
                const EdgeInsets.only(top: 8, left: 4, right: 3, bottom: 8),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.20000000298023224),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ],
      );
    } else if (widget.user.role == 'pasar') {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Diagram Stock Bawang',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 144,
            padding:
                const EdgeInsets.only(top: 8, left: 4, right: 3, bottom: 8),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.20000000298023224),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Diagram Harga Bawang',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 144,
            padding:
                const EdgeInsets.only(top: 8, left: 4, right: 3, bottom: 8),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.20000000298023224),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ],
      );
    }
    return Container();
  }
}
