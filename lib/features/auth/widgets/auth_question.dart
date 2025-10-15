import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class AuthQuestion extends StatelessWidget {
  const AuthQuestion({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            title,
            style: AppTextStyles.font16DarkBlueRegular.copyWith(
              color: AppColors.outerSpace,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Center(
            child: Text(
              subtitle,
              style: AppTextStyles.font16DarkBlueRegular,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
