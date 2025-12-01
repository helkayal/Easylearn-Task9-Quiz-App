import 'package:flutter/material.dart';
import 'package:task9_quiz_app/core/utils/app_string.dart';
import 'package:task9_quiz_app/features/home/presentation/views/quuiz_page_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppString.appTitle)),
      body: QuuizPageView(),
    );
  }
}
