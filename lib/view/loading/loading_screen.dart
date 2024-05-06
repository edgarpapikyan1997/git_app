import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.primaryBlue,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
