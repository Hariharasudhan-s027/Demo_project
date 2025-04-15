import 'package:demo_project/common/color_constant.dart';
import 'package:demo_project/common/function.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProgramStatusBarChart extends StatelessWidget {
  const ProgramStatusBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 5),
            const Divider(),
            const SizedBox(height: 5),
            AspectRatio(
              aspectRatio: 1.6,
              child: BarChart(
                BarChartData(
                  maxY: 55,
                  barGroups: [
                    _makeGroupData(0, 10, 6, 30),
                    _makeGroupData(1, 32, 34, 34),
                    _makeGroupData(2, 55, 30, 55),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 5,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          const ticks = [0, 5, 15, 25, 50];
                          int intValue = value.toInt();
                          return ticks.contains(intValue)
                              ? SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  space: 4,
                                  child: Text(
                                    intValue.toString(),
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: CommonFunction().hexToColor(
                                          CommonColorConstant().textColor),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink();
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          switch (value.toInt()) {
                            case 0:
                              return Text(
                                'Jan',
                                style: TextStyle(
                                  color: CommonFunction().hexToColor(
                                      CommonColorConstant().textColor),
                                ),
                              );
                            case 1:
                              return Text(
                                'Feb',
                                style: TextStyle(
                                  color: CommonFunction().hexToColor(
                                      CommonColorConstant().textColor),
                                ),
                              );
                            case 2:
                              return Text(
                                'Mar',
                                style: TextStyle(
                                  color: CommonFunction().hexToColor(
                                      CommonColorConstant().textColor),
                                ),
                              );
                            default:
                              return const Text('');
                          }
                        },
                      ),
                    ),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.grey.withOpacity(0.3),
                      strokeWidth: 1,
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      left: BorderSide(color: Colors.grey, width: 1),
                      bottom: BorderSide(color: Colors.grey, width: 1),
                      right: BorderSide(color: Colors.transparent),
                      top: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  barTouchData: BarTouchData(enabled: false),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildLegendItem(Color(0xFF0033A0), 'All programs'),
                buildLegendItem(Color(0xFF547AFE), 'Active'),
                buildLegendItem(Color(0xFFAAD4FF), 'Completed'),
              ],
            ),
          ],
        ),
      ),
    );
  }

Widget _buildHeader() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 6,
              height: 20,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF03a3bd),
                    Color(0xFF1967bf),
                  ],
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Program Status Metrics',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: CommonFunction().hexToColor(
                      CommonColorConstant().textColor),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(width: 8),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: CommonFunction().hexToColor('#dfecff'),
        ),
        width: 85,
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Month',
              style: TextStyle(
                color: CommonFunction().hexToColor(
                    CommonColorConstant().monthTextColor),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: CommonFunction().hexToColor(
                  CommonColorConstant().monthTextColor),
            ),
          ],
        ),
      ),
    ],
  );
}



  static BarChartGroupData _makeGroupData(
      int x, double c, double a, double all) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: c, color: const Color(0xFFAAD4FF), width: 8),
        BarChartRodData(toY: a, color: const Color(0xFF547AFE), width: 8),
        BarChartRodData(toY: all, color: const Color(0xFF0033A0), width: 8),
      ],
      barsSpace: 4,
    );
  }

  Widget buildLegendItem(Color color, String label) {
    return Row(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        SizedBox(width: 8),
        Text(label,
            style: TextStyle(
              fontSize: 12,
              color:
                  CommonFunction().hexToColor(CommonColorConstant().textColor),
            )),
      ],
    );
  }
}
