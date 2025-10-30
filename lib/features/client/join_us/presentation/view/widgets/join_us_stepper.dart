import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/theme/app_text_styles.dart';

class JoinUsStepper extends StatelessWidget {
  const JoinUsStepper({super.key, required this.isFirstStep});
  final bool isFirstStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: customStepItem(
            isCurrent: isFirstStep,
            isDone: !isFirstStep,
            stepTitle: LocaleKeys.joinUs_personalInformation.tr(),
          ),
        ),
        horizontalSpace(4),
        Expanded(
          child: customStepItem(
            isCurrent: !isFirstStep,
            isDone: false,
            stepTitle: LocaleKeys.joinUs_professionalInformation.tr(),
          ),
        ),
      ],
    );
  }

  Widget customStepItem({
    required isCurrent,
    required isDone,
    required String stepTitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21).r,
            color: isCurrent
                ? AppColors.yellow
                : isDone
                ? AppColors.darkBlue
                : AppColors.platinum,
          ),
        ),
        verticalSpace(4),
        Text(
          stepTitle,
          style: AppTextStyles.font14OuterSpaceSemiBold.copyWith(
            color: isCurrent
                ? AppColors.darkBlue
                : isDone
                ? AppColors.darkBlue
                : AppColors.gray,
          ),
        ),
      ],
    );
  }
}
