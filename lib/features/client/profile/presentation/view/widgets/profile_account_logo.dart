import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/helper/app_images.dart';
import '../../../../../../core/helper/functions.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/font_weight_helper.dart';
import '../../../../../../core/theme/spacing.dart';
import '../../../../../../core/widgets/bottom_sheet/open_bottom_sheet.dart';
import 'bottom_sheets/switch_account_bottom_sheet.dart';

class ProfileAccountLogo extends StatelessWidget {
  const ProfileAccountLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final name = 'Esraa Mohamed';
    final initials = getInitials(name);
    return GestureDetector(
      onTap: () {
        openBottomSheet(
          context: context,
          bottomSheetContent: SwitchAccountBottomSheet(),
        );
      },
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkBlue,
            ),
            child: Center(
              child: Text(
                initials,
                style: AppTextStyles.font18YellowRegular.copyWith(
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ),
          ),
          horizontalSpace(8),
          Text(
            name,
            style: AppTextStyles.font18YellowRegular.copyWith(
              color: AppColors.jet,
            ),
          ),
          Spacer(),
          SvgPicture.asset(AppImages.arrowDownIcon, width: 24.w, height: 24.h),
        ],
      ),
    );
  }
}
