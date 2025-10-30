import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class GradientImageBorder extends StatelessWidget {
  const GradientImageBorder({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(1), // border thickness
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              AppColors.darkBlue.withValues(alpha: 0.62),
              AppColors.darkBlue.withValues(alpha: 0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white, // background behind image
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset(
              image, // 👈 your image (local or network)
              width: 54.w,
              height: 54.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
