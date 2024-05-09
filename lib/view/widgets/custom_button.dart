import 'package:flutter/cupertino.dart';

import '../../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;

  const CustomButton({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primaryBlue),
        width: 44,
        height: 44,
        child: child ?? const SizedBox(),
      ),
    );
  }
}
