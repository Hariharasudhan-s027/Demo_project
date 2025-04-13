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
      // width: 165, // Adjust width as needed to center and align properly
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 28),
        leading: Image.asset(image, width: 22, height: 22,),
        title: Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
        horizontalTitleGap: 16, // controls spacing between icon and text
        onTap: () {},
      ),
    );
  }
}
