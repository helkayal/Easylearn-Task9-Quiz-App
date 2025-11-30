import 'package:flutter/material.dart';
import 'package:task9_quiz_app/core/theme/app_colors.dart';
import 'package:task9_quiz_app/core/utils/app_string.dart';
import 'package:task9_quiz_app/features/home/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              ),
              child: Text(
                AppString.appTitle,
                style: TextStyle(fontSize: 24, color: AppColors.whiteColor),
              ),
            ),
            CircularProgressIndicator(color: AppColors.whiteColor),
          ],
        ),
      ),
    );
  }
}
