import 'package:flutter/material.dart';

class QuuizPageView extends StatefulWidget {
  const QuuizPageView({super.key});

  @override
  State<QuuizPageView> createState() => _QuuizPageViewState();
}

class _QuuizPageViewState extends State<QuuizPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Center(child: Text('Quiz Page ${index + 1}'));
      },
    );
  }
}
