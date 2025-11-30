import 'package:flutter/material.dart';
import 'package:task9_quiz_app/core/theme/app_colors.dart';
import 'package:task9_quiz_app/core/utils/app_string.dart';
import 'package:task9_quiz_app/features/home/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 40,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz_logo.png',
              width: screenWidth * 0.5,
            ),
            Text(
              AppString.appTitle,
              style: TextStyle(fontSize: 24, color: AppColors.whiteColor),
            ),
            CircularProgressIndicator(color: AppColors.whiteColor),
          ],
        ),
      ),
    );
  }
}
