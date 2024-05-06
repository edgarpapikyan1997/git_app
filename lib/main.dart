import 'package:flutter/material.dart';
import 'package:git_app/utils/app_colors.dart';
import 'package:git_app/view/loading/loading_screen.dart';
import 'package:git_app/view/main_wrapper/main_wrapper.dart';


void main() {
  runApp(const App());
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.primaryBlue,
      ),
      home: Container(
        color: Colors.white,
          child: const MainWrapper()),
    );
  }
}



