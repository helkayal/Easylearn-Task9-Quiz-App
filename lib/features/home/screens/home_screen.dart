import 'package:flutter/material.dart';
import 'package:task9_quiz_app/core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is the Home Screen',
          style: TextStyle(fontSize: 24, color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
