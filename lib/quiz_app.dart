import 'package:flutter/material.dart';
import 'package:task9_quiz_app/core/theme/app_colors.dart';
import 'package:task9_quiz_app/features/splash/screens/splash_screen.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.blackColor),
      home: const SplashScreen(),
    );
  }
}
