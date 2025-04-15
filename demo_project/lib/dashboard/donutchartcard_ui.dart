import 'package:demo_project/common/color_constant.dart';
import 'package:demo_project/common/function.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DonutChartCard extends StatelessWidget {
  final String title;
  final int firstCount;
  final int secondCount;
  final String firstText;
  final String secondText;
  final int type;

  const DonutChartCard({
    super.key,
    required this.title,
    required this.firstCount,
    required this.secondCount,
    required this.firstText,
    required this.secondText,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final int total = firstCount + secondCount;

    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            _buildDonut(total),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildLegendItem(
                 type == 0 ? CommonFunction().hexToColor('#ffbb00') : CommonFunction().hexToColor('#1954bf'),
                  firstText,
                  firstCount,
                ),
                const SizedBox(width: 20),
                buildLegendItem(
                 type == 0 ? CommonFunction().hexToColor('#1954bf') : CommonFunction().hexToColor('#d4e5ff'),
                  secondText,
                  secondCount,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Row(
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
            Text(
              type == 0 ? 'Program Type Metrics' : 'Program Mode Metrics',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: CommonFunction().hexToColor(CommonColorConstant().textColor)),
            ),
          ],
        ),
        const Spacer(),
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
              Text('Month', style: TextStyle(color: CommonFunction().hexToColor(CommonColorConstant().monthTextColor),),),
              Icon(Icons.keyboard_arrow_down_outlined,color: CommonFunction().hexToColor(CommonColorConstant().monthTextColor),),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDonut(int total) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 200,
          width: 150,
          child: PieChart(
            PieChartData(
              startDegreeOffset: 170,
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              sections: [
                PieChartSectionData(
                  value: firstCount.toDouble(),
                  color: type == 0 ? CommonFunction().hexToColor('#ffbb00') : CommonFunction().hexToColor('#1954bf'),
                  radius: 25,
                  showTitle: false,
                ),
                PieChartSectionData(
                  value: secondCount.toDouble(),
                  color: type == 0 ? CommonFunction().hexToColor('#1954bf') : CommonFunction().hexToColor('#d4e5ff'),
                  radius: 25,
                  showTitle: false,
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Text(
              'Total Programs',
              style: TextStyle(fontSize: 14, color: CommonFunction().hexToColor(CommonColorConstant().textColor), fontWeight: FontWeight.w600),
            ),
            Text(
              '$total',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: CommonFunction().hexToColor(CommonColorConstant().textColor)),
            ),
          ],
        ),
      ],
    );
  }
  Widget buildLegendItem(Color color, String label, int value) {
  return Row(
    children: [
      CircleAvatar(radius: 5, backgroundColor: color),
      const SizedBox(width: 6),
      Text("$label $value", style: TextStyle(color: CommonFunction().hexToColor(CommonColorConstant().textColor), fontWeight: FontWeight.w600),)
    ],
  );
}
}
