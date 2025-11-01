import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';

class ProfileContentItem extends StatelessWidget {
  const ProfileContentItem({
    super.key,
    required this.icon,
    required this.title,
    this.isDivider = true,
    this.leading,
  });
  final String icon;
  final String title;
  final bool isDivider;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon, width: 22.w, height: 22.h),
            horizontalSpace(8),
            Text(title, style: AppTextStyles.font14OuterSpaceMedium),
            if (leading != null) ...[Spacer(), leading ?? SizedBox.shrink()],
          ],
        ),
        if (isDivider) ...[
          verticalSpace(20),
          Divider(color: AppColors.platinum),
          verticalSpace(20),
        ],
      ],
    );
  }
}
