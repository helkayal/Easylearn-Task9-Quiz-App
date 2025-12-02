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
  late int _currentPage;
  late Map<int, int> _selectedAnswers;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _selectedAnswers = {};
  }

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
              buildQuestNoText(),
              SizedBox(height: 50),
              QuestionCard(questionText: quizData[_currentPage].question),
              Spacer(),
              buildAnswersList(),
              Spacer(),
              Center(child: buildNextButton(screenWidth)),
              Spacer(),
            ],
          ),
        );
      },
    );
  }

  Text buildQuestNoText() {
    return Text(
      '${AppString.questionNoText} ${_currentPage + 1} / $_totalPages',
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  ListView buildAnswersList() {
    return ListView.separated(
      itemBuilder: (context, optionIndex) {
        final isSelected = _selectedAnswers[_currentPage] == optionIndex;
        return AnswerCard(
          answerText: quizData[_currentPage].answers.keys.toList()[optionIndex],
          isSelected: isSelected,
          onTap: () {
            setState(() {
              _selectedAnswers[_currentPage] = optionIndex;
            });
          },
        );
      },
      itemCount: quizData[_currentPage].answers.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 12);
      },
    );
  }

  ElevatedButton buildNextButton(double screenWidth) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (_currentPage < _totalPages - 1) {
            _currentPage++;
          } else {
            int finalScore = 0;
            _selectedAnswers.forEach((questionIndex, selectedAnswerIndex) {
              bool isCorrectAnswer = quizData[questionIndex].answers.values
                  .toList()[selectedAnswerIndex];
              if (isCorrectAnswer) {
                finalScore++;
              }
            });

            buildResultDialog(finalScore);
          }
        });
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(screenWidth, 48),
        backgroundColor: AppColors.whiteColor,
        padding: EdgeInsets.symmetric(vertical: 12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(
        _currentPage == _totalPages - 1
            ? AppString.submitLabel
            : AppString.nextLabel,
        style: TextStyle(color: AppColors.blackColor, fontSize: 20),
      ),
    );
  }

  Future<dynamic> buildResultDialog(int finalScore) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        bool isPassed = finalScore >= (_totalPages / 2).ceil();
        String resultMessage = isPassed
            ? '${AppString.successText} $finalScore / $_totalPages'
            : '${AppString.failedText} $finalScore / $_totalPages';
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Text(
            resultMessage,
            style: TextStyle(
              fontSize: 24,
              color: isPassed ? AppColors.greenColor : AppColors.redColor,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.blackColor,
                foregroundColor: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(AppString.restartLabel),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentPage = 0;
                  _selectedAnswers = {};
                });
              },
            ),
          ],
        );
      },
    );
  }
}
