import 'package:demo_project/common/color_constant.dart';
import 'package:demo_project/common/function.dart';
import 'package:flutter/material.dart';

class DataTableCard extends StatelessWidget {
  final String title;
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final ScrollController scrollController;

  const DataTableCard({
    super.key,
    required this.title,
    required this.columns,
    required this.rows,
    required this.scrollController,
  });

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
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            _buildDataTable(context),
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
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CommonFunction()
                    .hexToColor(CommonColorConstant().textColor),
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            Image.asset(
              'assets/share.png',
              width: 27,
              height: 27,
            ),
          ],
        ),
        const Spacer(),
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
              style: TextStyle(
                color:
                    CommonFunction().hexToColor(CommonColorConstant().textColor),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDataTable(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width > 600;
    return ScrollbarTheme(
      data: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(Colors.black),
        trackColor: WidgetStateProperty.all(Colors.grey.shade300),
        trackBorderColor: WidgetStateProperty.all(Colors.grey.shade400),
        radius: const Radius.circular(4),
        thickness: WidgetStateProperty.all(5),
      ),
      child: Scrollbar(
        controller: scrollController,
        thickness: 5,
        thumbVisibility: true,
        trackVisibility: true,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: DataTableTheme(
                  data: DataTableThemeData(
                    columnSpacing: isTablet ? 180 : 50,
                    dividerThickness: 0,
                    dataRowColor: WidgetStatePropertyAll(Colors.white),
                    headingTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CommonFunction()
                          .hexToColor(CommonColorConstant().textColor),
                    ),
                    dataTextStyle: TextStyle(
                      color: CommonFunction()
                          .hexToColor(CommonColorConstant().textColor),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: DataTable(
                        headingRowColor:
                            WidgetStateProperty.all(Colors.blue[50]),
                        columns: columns,
                        rows: rows,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
