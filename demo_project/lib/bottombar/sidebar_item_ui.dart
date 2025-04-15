 import 'package:demo_project/common/color_constant.dart';
import 'package:demo_project/common/function.dart';
import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final String image;
  final String label;

  const SidebarItem({
    super.key,
    required this.image,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListTile(
        leading: Image.asset(image, width: 22, height: 22,),
        title: Text(
          label,
          style: TextStyle(color: CommonFunction().hexToColor(CommonColorConstant().textColor), fontSize: 12),
        ),
        horizontalTitleGap: 16,
        onTap: () {},
      ),
    );
  }
}
