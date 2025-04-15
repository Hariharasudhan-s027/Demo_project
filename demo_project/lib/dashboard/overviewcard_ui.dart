import 'package:demo_project/common/color_constant.dart';
import 'package:demo_project/common/function.dart';
import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width > 600;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            if (isTablet)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatBlock("327", "Programs", CommonFunction().hexToColor('#fff4de')),
                    _buildStatBlock("120", "Mentors", CommonFunction().hexToColor('#c9f7f5')),
                    _buildStatBlock("556", "Mentees", CommonFunction().hexToColor('#eee5ff')),
                  ],
                ),
              )
            else
              Column(
                children: [
                  _buildStatBlock("327", "Programs", CommonFunction().hexToColor('#fff4de')),
                  _buildStatBlock("120", "Mentors", CommonFunction().hexToColor('#c9f7f5')),
                  _buildStatBlock("556", "Mentees", CommonFunction().hexToColor('#eee5ff')),
                ],
              ),
          ],
        ),
      ),
    );
  }


  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 6,
              height: 20,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    CommonFunction().hexToColor('#03a3bd'),
                    CommonFunction().hexToColor('#1967bf'),
                  ],
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 8),
             Text(
              'Planned Programs',
              style: TextStyle(
                color: CommonFunction().hexToColor(CommonColorConstant().textColor),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 35,
          width: 100,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              backgroundColor: CommonFunction().hexToColor('#dfecff'),
              elevation: 0,
            ),
            child: Text(
              "View All",
              style: TextStyle(color: CommonFunction().hexToColor(CommonColorConstant().textColor),),
            ),
          ),
        )
      ],
    );
  }

Widget _buildStatBlock(String number, String label, Color bgColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              number,
              style:  TextStyle(
                fontSize: 20,
                color: CommonFunction().hexToColor(CommonColorConstant().textColor),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style:  TextStyle(
              fontSize: 16,
              color: CommonFunction().hexToColor(CommonColorConstant().textColor),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
