import 'package:demo_project/bottombar/sidebar_item_ui.dart';
import 'package:demo_project/common/color_constant.dart';
import 'package:demo_project/common/function.dart';
import 'package:demo_project/dashboard/dashboard_ui.dart';
import 'package:demo_project/programs/programs_ui.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 1;
  bool showSideTab = false;
  ScrollController scroll = ScrollController();

  final List<Widget> _pages = [
    DashboardPage(),
    ProgramPage(),
    ProgramPage(),
    ProgramPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                child: ClipOval(
                  child: Image.asset(
                    'assets/profile.png',
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/search.png', width: 40, height: 40,)),
                  SizedBox(width: 8,),
                  GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/notification.png', width: 40, height: 40,)),
                  SizedBox(width: 8,),
                  GestureDetector(
                  onTap: () {
                     setState(() {
                      showSideTab = true;
                    });
                  },
                  child: Image.asset('assets/menu.png', width: 30, height: 30,)),
                  SizedBox(width: 8,)
              ],
            ),
            body: _pages[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex, 
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black54,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: "Dashboard",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: "Programs",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: "Users",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_long),
                  label: "Requests",
                ),
              ],
            ),
          ),
        ),
        if (showSideTab == true) ...[
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showSideTab = false;
                });
              },
              child: Container(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
          Positioned(right: 0, top: 28, child: sideTabView(context))
        ]
      ],
    );
  }
  Widget sideTabView(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    var orientation = MediaQuery.of(context).orientation;
    double desiredWidth;
    double desiredHeight;
    if (screenSize.width < 700) {
      // Mobile
      if (orientation == Orientation.portrait) {
        // Mobile Portrait
        desiredWidth = 200;
        desiredHeight = 600;
      } else {
        // Mobile Landscape
        desiredWidth = 200;
        desiredHeight = screenSize.height;
      }
    } else {
      // Tablet
      if (orientation == Orientation.portrait) {
        // Tablet Portrait
        desiredWidth = 300;
        desiredHeight = 750;
      } else {
        // Tablet Landscape
        desiredWidth = 300;
        desiredHeight = 690;
      }
    }
    return Material(
      child: Container(
        width: desiredWidth,
        height: desiredHeight,
        color: Colors.white,
        child: ScrollbarTheme(
          data: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(Colors.black),
        trackColor: WidgetStateProperty.all(Colors.grey.shade300),
        trackBorderColor: WidgetStateProperty.all(Colors.grey.shade400),
        radius: const Radius.circular(4),
        thickness: WidgetStateProperty.all(5),
      ),
          child: Scrollbar(
            controller: scroll,
            thickness: 5,
          thumbVisibility: true,
          trackVisibility: true,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 22),
                    child: Text(
                      "Admin",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: desiredWidth - 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(2, 2), 
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/profile.png',
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "John Doe",
                                  style: TextStyle(
                                      color: CommonFunction().hexToColor(CommonColorConstant().textColor), fontSize: 12),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Mentor",
                                  style:
                                      TextStyle(color: CommonFunction().hexToColor(CommonColorConstant().textColor), fontSize: 10),
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  width: desiredWidth - 40,
                                  child: Divider(color: Colors.grey.shade300),
                                )
                              ],
                            ),
                          ),
                          SidebarItem(
                              image: 'assets/schedular.png', label: "Schedular"),
                          SidebarItem(image: 'assets/feed.png', label: "Timesheet"),
                          SidebarItem(image: 'assets/discussions.png', label: "Discussions"),
                          SidebarItem(image: 'assets/report.png', label: "Reports"),
                          SidebarItem(image: 'assets/feedback.png', label: "Feedback"),
                          SidebarItem(
                              image: 'assets/certificate.png', label: "Certificates"),
                          SidebarItem(image: 'assets/feed.png', label: "Feed"),
                          SidebarItem(image: 'assets/analytics.png', label: "Analytics"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
