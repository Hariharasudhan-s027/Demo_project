import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _buildMobileDashboard();
          } else {
            return _buildTabletDashboard();
          }
        },
      ),
    );
  }

  // MOBILE LAYOUT
  Widget _buildMobileDashboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _buildOverviewCard(),
          const SizedBox(height: 12),
          _buildBarChart(),
          const SizedBox(height: 12),
          _buildTopProgramsList(),
          const SizedBox(height: 12),
          _buildTopUsersList(),
          const SizedBox(height: 12),
          _buildDonutChart("Program Types", 40, 54, 'Premium', 'Free', 0),
          const SizedBox(height: 12),
          _buildDonutChart(
              "Program Categories", 36, 50, 'Virtual', 'Physical', 1),
        ],
      ),
    );
  }

  // TABLET LAYOUT
  Widget _buildTabletDashboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildOverviewCard()),
              const SizedBox(width: 16),
              Expanded(child: _buildBarChart()),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTopProgramsList()),
              const SizedBox(width: 16),
              Expanded(child: _buildTopUsersList()),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  child: _buildDonutChart(
                      "Program Types", 40, 54, 'Premium', 'Free', 0)),
              const SizedBox(width: 16),
              Expanded(
                  child: _buildDonutChart(
                      "Program Categories", 36, 50, 'Virtual', 'Physical', 1)),
            ],
          ),
        ],
      ),
    );
  }

  // Overview Card
  Widget _buildOverviewCard() {
    return Card(
      color: Colors.white,
      // margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
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
                            hexToColor('#03a3bd'),
                            hexToColor('#1967bf'),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Planned Programs',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2), // <-- Radius
                    ),
                    backgroundColor: hexToColor('#dfecff'),
                    elevation: 0,
                  ),
                  child: const Text(
                    "View All",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Divider(),
            const SizedBox(height: 8),
            // Stat blocks
            _buildStatBlock("327", "Programs", hexToColor('#fff4de')),
            _buildStatBlock("120", "Mentors", hexToColor('#c9f7f5')),
            _buildStatBlock("556", "Mentees", hexToColor('#eee5ff')),
          ],
        ),
      ),
    );
  }

  Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex'; // Add the opacity if not provided
    }
    return Color(int.parse(hex, radix: 16));
  }

  Widget _buildStatBlock(String number, String label, Color bgColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Bar Chart
  Widget _buildBarChart() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      // margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and dropdown
            Row(
              children: [
                // Gradient + Text group
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
                            hexToColor('#03a3bd'),
                            hexToColor('#1967bf'),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Program Status Metrics',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Spacer(),
                // Dropdown container
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: hexToColor('#dfecff'),
                  ),
                  width: 75,
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Month'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),
            Divider(),
            const SizedBox(height: 5),
            AspectRatio(
              aspectRatio: 1.6,
              child: BarChart(
                BarChartData(
                  maxY: 55,
                  barGroups: [
                    makeGroupData(0, 10, 6, 30),
                    makeGroupData(1, 32, 34, 34),
                    makeGroupData(2, 55, 30, 55),
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

                          if (ticks.contains(intValue)) {
                            return Text(
                              intValue.toString(),
                              style: TextStyle(fontSize: 10),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          switch (value.toInt()) {
                            case 0:
                              return Text('Jan');
                            case 1:
                              return Text('Feb');
                            case 2:
                              return Text('Mar');
                            default:
                              return Text('');
                          }
                        },
                      ),
                    ),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: false),
                  barTouchData: BarTouchData(enabled: false),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Legend
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

  Widget buildLegendItem(Color color, String label) {
    return Row(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        SizedBox(width: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  // Top Programs
  Widget _buildTopProgramsList() {
  final List<Map<String, dynamic>> mentors = [
    {
      "name": "Leadership Growth",
      "category": "Engineer",
      "createdBy": "(202) 555–0191",
      "email": 'contact@company.com'
    },
    {
      "name": 'Tech Mentorship',
      "category": 'Doctor',
      "createdBy": '(303) 555–0123',
      "email": 'support@info.com',
    },
    {
      "name": 'Career Guidance',
      "category": 'Artist',
      "createdBy": '(404) 555–0145',
      "email": 'info@techs.com',
    },
    {
      "name": 'Business Skills',
      "category": 'Chef',
      "createdBy": '(505) 555–0167',
      "email": 'hello@design.com',
    },
    {
      "name": 'Soft Skills',
      "category": 'Teacher',
      "createdBy": '(606) 555–0189',
      "email": 'team@future.com',
    },
  ];

  final isTablet = MediaQuery.of(context).size.width > 600;

  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              // Gradient + Text group
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
                          hexToColor('#03a3bd'),
                          hexToColor('#1967bf'),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Top Mentors',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Image.asset('assets/share.png', width: 27, height: 27),
                ],
              ),
              Spacer(),
              // Dropdown container
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: hexToColor('#dfecff'),
                ),
                width: 75,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Month'),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Divider(),
          const SizedBox(height: 8),
          // Table with border and rounded corners
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTableTheme(
                data: DataTableThemeData(
                  dividerThickness: 0, // Removes row dividers
                  dataRowColor: WidgetStateProperty.all<Color>(Colors.white),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DataTable(
                    headingRowColor: WidgetStateProperty.all(Colors.blue[50]),
                    columns: [
                      DataColumn(label: Text('Mentor Name')),
                      DataColumn(label: Text('category')),
                      if (isTablet) DataColumn(label: Text('createdBy')),
                      if (isTablet) DataColumn(label: Text('email')),
                    ],
                    rows: mentors.map((mentor) {
                      return DataRow(cells: [
                        DataCell(Text(mentor["name"])),
                        DataCell(Text(mentor["category"])),
                        if (isTablet) DataCell(Text(mentor["createdBy"])),
                        if (isTablet)
                          DataCell(Row(
                            children: [
                              Text(mentor["email"].toString()),
                            ],
                          )),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


  // Top Users
Widget _buildTopUsersList() {
  final List<Map<String, dynamic>> mentors = [
    {
      "name": "Jonh kennedy",
      "program": "Teaching Program",
      "email": "johnk@gmail.com",
      "rating": 4.9
    },
    {
      "name": "Jenifer Smith",
      "program": "Teaching Program",
      "email": "jenny@gmail.com",
      "rating": 4.8
    },
    {
      "name": "Thomas shelby",
      "program": "Teaching Program",
      "email": "thomas@gmail.com",
      "rating": 4.7
    },
    {
      "name": "John Miller",
      "program": "Teaching Program",
      "email": "miller@gmail.com",
      "rating": 4.5
    },
    {
      "name": "Jason Morgan",
      "program": "Teaching Program",
      "email": "jason@gmail.com",
      "rating": 4.8
    },
  ];

  final isTablet = MediaQuery.of(context).size.width > 600;

  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              // Gradient + Text group
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
                          hexToColor('#03a3bd'),
                          hexToColor('#1967bf'),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Top Mentors',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Image.asset('assets/share.png', width: 27, height: 27),
                ],
              ),
              Spacer(),
              // Dropdown container
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: hexToColor('#dfecff'),
                ),
                width: 75,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Month'),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Divider(),
          const SizedBox(height: 8),
          // Table with border and rounded corners
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTableTheme(
                data: DataTableThemeData(
                  dividerThickness: 0, // Removes the line between rows
                  dataRowColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DataTable(
                    headingRowColor: WidgetStateProperty.all(Colors.blue[50]),
                    columns: [
                      DataColumn(label: Text('Mentor Name')),
                      DataColumn(label: Text('Program')),
                      if (isTablet) DataColumn(label: Text('Email')),
                      if (isTablet) DataColumn(label: Text('Rating')),
                    ],
                    rows: mentors.map((mentor) {
                      return DataRow(cells: [
                        DataCell(Text(mentor["name"])),
                        DataCell(Text(mentor["program"])),
                        if (isTablet) DataCell(Text(mentor["email"])),
                        if (isTablet)
                          DataCell(Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 18),
                              SizedBox(width: 4),
                              Text(mentor["rating"].toString()),
                            ],
                          )),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


  // Donut Chart
  Widget _buildDonutChart(String title, int firstCount, int secondCount,
      String firstText, String secondText, int type) {
    final int total = firstCount + secondCount;
    return Card(
      elevation: 4,
      color: Colors.white,
      // margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header
            Row(
              children: [
                // Gradient + Text group
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
                            hexToColor('#03a3bd'),
                            hexToColor('#1967bf'),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      type == 0
                          ? 'Program Type Metrics'
                          : 'Program Mode Metrics',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Spacer(),
                // Dropdown container
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: hexToColor('#dfecff'),
                  ),
                  width: 75,
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Month'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(),
            const SizedBox(height: 8),
            // Chart with total in center
            Stack(
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
                          color: type == 0
                              ? hexToColor('#ffbb00')
                              : hexToColor('#1954bf'),
                          radius: 25,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: secondCount.toDouble(),
                          color: type == 0
                              ? hexToColor('#1954bf')
                              : hexToColor('#d4e5ff'),
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
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    Text(
                      '$total',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(
                  type == 0 ? hexToColor('#ffbb00') : hexToColor('#1954bf'),
                  firstText,
                  firstCount,
                ),
                const SizedBox(width: 20),
                _buildLegendItem(
                  type == 0 ? hexToColor('#1954bf') : hexToColor('#d4e5ff'),
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
}

Widget _buildLegendItem(Color color, String label, int value) {
  return Row(
    children: [
      CircleAvatar(radius: 5, backgroundColor: color),
      const SizedBox(width: 6),
      Text("$label $value"),
    ],
  );
}

BarChartGroupData makeGroupData(int x, double c, double a, double all) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(toY: c, color: Color(0xFFAAD4FF), width: 8),
      BarChartRodData(toY: a, color: Color(0xFF547AFE), width: 8),
      BarChartRodData(toY: all, color: Color(0xFF0033A0), width: 8),
    ],
    barsSpace: 4,
  );
}
