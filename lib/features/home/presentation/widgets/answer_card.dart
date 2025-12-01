import 'package:flutter/material.dart';
import 'package:task9_quiz_app/core/theme/app_colors.dart';

class AnswerCard extends StatelessWidget {
  final String answerText;
  const AnswerCard({super.key, required this.answerText});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(screenWidth, 40),
        backgroundColor: AppColors.greyColor,
        padding: EdgeInsets.symmetric(vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Text(
        answerText,
        style: TextStyle(color: AppColors.blackColor, fontSize: 18),
      ),
    );
  }
}
