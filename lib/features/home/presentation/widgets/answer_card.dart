import 'package:flutter/material.dart';
import 'package:task9_quiz_app/core/theme/app_colors.dart';

class AnswerCard extends StatelessWidget {
  final String answerText;
  final VoidCallback? onTap;
  final bool isSelected;
  const AnswerCard({
    super.key,
    required this.answerText,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(screenWidth, 40),
        backgroundColor: isSelected
            ? AppColors.yellowColor
            : AppColors.greyColor,
        padding: EdgeInsets.symmetric(vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Text(
        answerText,
        style: TextStyle(
          color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
