import 'package:flutter/material.dart';
import 'package:task9_quiz_app/core/theme/app_colors.dart';
import 'package:task9_quiz_app/core/utils/app_string.dart';
import 'package:task9_quiz_app/features/home/presentation/widgets/answer_card.dart';
import 'package:task9_quiz_app/features/home/presentation/widgets/question_card.dart';

class QuuizPageView extends StatefulWidget {
  const QuuizPageView({super.key});

  @override
  State<QuuizPageView> createState() => _QuuizPageViewState();
}

class _QuuizPageViewState extends State<QuuizPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 5;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final int page = (_pageController.page ?? 0).round();
      if (page != _currentPage) setState(() => _currentPage = page);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _totalPages,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildQuestNoText(index),
              SizedBox(height: 50),
              QuestionCard(
                questionText: 'This is question number ${index + 1}?',
              ),
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

  Text buildQuestNoText(int index) {
    return Text(
      '${AppString.questionNoText} ${index + 1} / $_totalPages',
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
        return AnswerCard(answerText: 'This is option ${optionIndex + 1}');
      },
      itemCount: 4,
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
        if (_currentPage < _totalPages - 1) {
          _pageController.animateToPage(
            _currentPage + 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {}
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(screenWidth, 48),
        backgroundColor: AppColors.whiteColor,
        padding: EdgeInsets.symmetric(vertical: 12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(
        _currentPage < _totalPages - 1
            ? AppString.nextLabel
            : AppString.submitLabel,
        style: TextStyle(color: AppColors.blackColor, fontSize: 20),
      ),
    );
  }
}
