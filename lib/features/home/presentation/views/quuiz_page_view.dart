import 'package:flutter/material.dart';
import 'package:task9_quiz_app/core/theme/app_colors.dart';
import 'package:task9_quiz_app/core/utils/app_string.dart';
import 'package:task9_quiz_app/features/home/model/quiz_model.dart';
import 'package:task9_quiz_app/features/home/presentation/widgets/answer_card.dart';
import 'package:task9_quiz_app/features/home/presentation/widgets/question_card.dart';

class QuuizPageView extends StatefulWidget {
  const QuuizPageView({super.key});

  @override
  State<QuuizPageView> createState() => _QuuizPageViewState();
}

class _QuuizPageViewState extends State<QuuizPageView> {
  final int _totalPages = quizData.length;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return PageView.builder(
      itemCount: _totalPages,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildQuestNoText(index),
              SizedBox(height: 50),
              QuestionCard(questionText: quizData[index].question),
              Spacer(),
              buildAnswersList(index),
              Spacer(),
              Center(child: buildNextButton(screenWidth)),
              Spacer(),
            ],
          ),
        );
      },
    );
  }

  Text buildQuestNoText(int questionIndex) {
    return Text(
      '${AppString.questionNoText} ${questionIndex + 1} / $_totalPages',
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  ListView buildAnswersList(int questionIndex) {
    return ListView.separated(
      itemBuilder: (context, optionIndex) {
        return AnswerCard(
          answerText: quizData[questionIndex].answers.keys
              .toList()[optionIndex],
        );
      },
      itemCount: quizData[questionIndex].answers.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 12);
      },
    );
  }

  ElevatedButton buildNextButton(double screenWidth) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(screenWidth, 48),
        backgroundColor: AppColors.whiteColor,
        padding: EdgeInsets.symmetric(vertical: 12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(
        AppString.nextLabel,
        style: TextStyle(color: AppColors.blackColor, fontSize: 20),
      ),
    );
  }
}
