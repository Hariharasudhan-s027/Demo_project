import 'package:flutter/material.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/calender.png'),
              SizedBox(height: 20),
              Text(
                "Coming soon",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        );
  }
}