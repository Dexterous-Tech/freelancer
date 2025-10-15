import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/font_weight_helper.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/client/profile/presentation/view/widgets/profile_content_item.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/helper/functions.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    final name = 'Ahmed Ali';
    final initials = getInitials(name);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                SvgPicture.asset(
                  AppImages.arrowDownIcon,
                  width: 24.w,
                  height: 24.h,
                ),
              ],
            ),
            verticalSpace(32),
            Text(
              LocaleKeys.profile_basicInformation.tr(),
              style: AppTextStyles.font12OuterSpaceSemiBold,
            ),
            verticalSpace(28),
            ProfileContentItem(
              icon: AppImages.profileIcon,
              title: LocaleKeys.profile_editProfile.tr(),
            ),
            ProfileContentItem(
              icon: AppImages.locationIcon,
              title: LocaleKeys.profile_location.tr(),
            ),
            ProfileContentItem(
              icon: AppImages.heartIcon,
              title: LocaleKeys.profile_fav.tr(),
            ),
            ProfileContentItem(
              icon: AppImages.joinServiceIcon,
              title: LocaleKeys.profile_joinService.tr(),
              isDivider: false,
            ),
            verticalSpace(52),
            Text(
              LocaleKeys.profile_exitApp.tr(),
              style: AppTextStyles.font12OuterSpaceSemiBold,
            ),
            verticalSpace(28),

            ProfileContentItem(
              icon: AppImages.logoutIcon,
              title: LocaleKeys.profile_logout.tr(),
            ),
            ProfileContentItem(
              icon: AppImages.deleteIcon,
              title: LocaleKeys.profile_deleteAccount.tr(),
              isDivider: false,
            ),
          ],
        ),
      ),
    );
  }
}
