import 'package:demo_project/dashboard/datatablecard_ui.dart';
import 'package:demo_project/dashboard/donutchartcard_ui.dart';
import 'package:demo_project/dashboard/overviewcard_ui.dart';
import 'package:demo_project/dashboard/programstatusbarchar_ui.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  ScrollController horizontalScroll1 = ScrollController();
  ScrollController horizontalScroll2 = ScrollController();

  @override
  void dispose() {
    horizontalScroll1.dispose();
    horizontalScroll2.dispose();
    super.dispose();
  }

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
          OverviewCard(),
          const SizedBox(height: 12),
          ProgramStatusBarChart(),
          const SizedBox(height: 12),
          buildTopPrograms(horizontalScroll1),
          const SizedBox(height: 12),
          buildTopUsers(horizontalScroll2),
          const SizedBox(height: 12),
          DonutChartCard(
            title: "Program Types",
            firstCount: 40,
            secondCount: 54,
            firstText: "Premium",
            secondText: "Free",
            type: 0,
          ),
          const SizedBox(height: 12),
          DonutChartCard(
            title: "Program Categories",
            firstCount: 36,
            secondCount: 50,
            firstText: "Virtual",
            secondText: "Physical",
            type: 1,
          ),
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
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(child: OverviewCard()),
                const SizedBox(width: 16),
                Expanded(child: ProgramStatusBarChart()),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              buildTopPrograms(horizontalScroll1),
              const SizedBox(width: 16),
              buildTopUsers(horizontalScroll2),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: DonutChartCard(
                  title: "Program Types",
                  firstCount: 40,
                  secondCount: 54,
                  firstText: "Premium",
                  secondText: "Free",
                  type: 0,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DonutChartCard(
                  title: "Program Categories",
                  firstCount: 36,
                  secondCount: 50,
                  firstText: "Virtual",
                  secondText: "Physical",
                  type: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget buildTopPrograms(ScrollController scrollController) {
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

    return DataTableCard(
      title: 'Top Mentors',
      scrollController: scrollController,
      columns: const [
        DataColumn(label: Text('Program Name')),
        DataColumn(label: Text('Category')),
        DataColumn(label: Text('Created By')),
        DataColumn(label: Text('Rating')),
      ],
      rows: mentors.map((mentor) {
        return DataRow(
          cells: [
            DataCell(Text(mentor["name"])),
            DataCell(Text(mentor["category"])),
            DataCell(Text(mentor["createdBy"])),
            DataCell(Text(mentor["email"])),
          ],
        );
      }).toList(),
    );
  }

  Widget buildTopUsers(ScrollController scrollController) {
    final List<Map<String, dynamic>> users = [
      {
        "name": "Jonh Kennedy",
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
        "name": "Thomas Shelby",
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

    return DataTableCard(
      title: 'Top Users',
      scrollController: scrollController,
      columns: const [
        DataColumn(label: Text('Mentor Name')),
        DataColumn(label: Text('Program')),
        DataColumn(label: Text('Email')),
        DataColumn(label: Text('Rating')),
      ],
      rows: users.map((user) {
        return DataRow(
          cells: [
            DataCell(Text(user["name"])),
            DataCell(Text(user["program"])),
            DataCell(Text(user["email"])),
            DataCell(Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 18),
                const SizedBox(width: 4),
                Text(user["rating"].toString()),
              ],
            )),
          ],
        );
      }).toList(),
    );
  }
}
