import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback onTap;
  final double height;
  final double width;

  const CustomButton(
      {super.key,
      this.child,
      required this.onTap,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primaryBlue),
        height: height,
        width: width,
        child: child ?? const SizedBox(),
      ),
    );
  }
}
