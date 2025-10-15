import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_bottom_button.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'package:freelancer/features/client/edit_profile/presentation/view/widgets/client_edit_profile_form.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/helper/functions.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class ClientEditProfileBody extends StatelessWidget {
  const ClientEditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final name = 'Ahmed Ali';
    final initials = getInitials(name);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(title: LocaleKeys.profile_profileTitle.tr()),
        verticalSpace(24),
        Center(
          child: Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkBlue,
            ),
            child: Center(
              child: Text(initials, style: AppTextStyles.font20YellowMedium),
            ),
          ),
        ),
        verticalSpace(8),
        Center(child: Text(name, style: AppTextStyles.font24JetRegular)),
        verticalSpace(32),
        ClientEditProfileForm(),
        // Expanded(child: verticalSpace(100)),
        Spacer(),
        CustomBottomButton(textButton: LocaleKeys.save.tr()),
      ],
    );
  }
}
