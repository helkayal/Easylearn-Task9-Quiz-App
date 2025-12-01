import 'package:flutter/material.dart';
import 'package:task9_quiz_app/core/theme/app_colors.dart';

class QuestionCard extends StatelessWidget {
  final String questionText;
  const QuestionCard({super.key, required this.questionText});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            alignment: Alignment.center,
            width: screenWidth,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              questionText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: AppColors.blackColor),
            ),
          ),
          Positioned(
            top: -30,
            left: screenWidth / 2 - 45,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.whiteColor,
              child: Icon(Icons.check, size: 30, color: AppColors.greenColor),
            ),
          ),
          Positioned(
            top: 25,
            left: -25,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.blackColor,
            ),
          ),
          Positioned(
            top: 25,
            right: -25,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
