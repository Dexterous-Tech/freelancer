import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/spacing.dart';

class EditProfileAdditional extends StatelessWidget {
  const EditProfileAdditional({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });
  final void Function()? onTap;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(icon, width: 24.w, height: 24.h),
          horizontalSpace(4),
          Text(
            title,
            style: AppTextStyles.font18YellowRegular.copyWith(
              color: AppColors.darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
