import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';

class GradiantIconBorder extends StatelessWidget {
  const GradiantIconBorder({
    super.key,
    required this.assetName,
    this.colorFilter,
    this.iconSize,
  });

  final String assetName;
  final ColorFilter? colorFilter;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.darkBlue.withValues(alpha: 0.62),
            AppColors.darkBlue.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            assetName,
            width: iconSize?.w ?? 18.w,
            height: iconSize?.h ?? 18.h,
            fit: BoxFit.scaleDown,
            colorFilter: colorFilter,
          ),
        ),
      ),
    );
  }
}
