import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer/core/helper/extensions.dart';

import '../../../../../../../core/helper/app_images.dart';
import '../../../../../../../core/helper/functions.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/spacing.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../data/models/profile_models.dart';

class SwitchAccountBottomSheet extends StatelessWidget {
  const SwitchAccountBottomSheet({super.key, required this.profileDataModel});

  final ProfileDataModel profileDataModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 37.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.profile_switchAccount.tr(),
            style: AppTextStyles.font20YellowMedium.copyWith(
              color: AppColors.jet,
            ),
          ),
          verticalSpace(8),
          Text(
            LocaleKeys.profile_easySwitch.tr(),
            style: AppTextStyles.font14GrayMedium.copyWith(
              color: AppColors.davyGrey,
            ),
          ),
          verticalSpace(30),
          accountItem(
            isSelected: true,
            name: '${profileDataModel.firstName} ${profileDataModel.lastName}',
          ),
          // accountItem(
          //   isSelected: false,
          //   name: 'El-sayed Ramadan',
          //   image: AppImages.personImage,
          // ),
        ],
      ),
    );
  }

  Widget accountItem({
    required bool isSelected,
    String? image,
    required String name,
  }) {
    final initials = getInitials(name);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.floralWhite : Colors.transparent,
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: image.isNullOrEmpty()
                  ? AppColors.darkBlue
                  : Colors.transparent,
              border: image.isNullOrEmpty()
                  ? null
                  : Border.all(color: AppColors.platinum),
            ),
            child: image.isNullOrEmpty()
                ? Center(
                    child: Text(
                      initials,
                      style: AppTextStyles.font16JetMedium.copyWith(
                        color: AppColors.yellow,
                      ),
                    ),
                  )
                : ClipOval(
                    child: Image.asset(
                      image ?? '',
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
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
          if (!isSelected) ...[
            verticalSpace(8),
            SvgPicture.asset(AppImages.badgeIcon, width: 16.w, height: 16.h),
          ],
          Spacer(),
          SvgPicture.asset(
            isSelected
                ? AppImages.correctSelectedIcon
                : AppImages.arrowLeftGrayIcon,
            width: 24.w,
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
