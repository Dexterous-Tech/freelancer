import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_bottom_button.dart';
import 'package:freelancer/features/auth/widgets/custom_message_text_form_field.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../manager/folders_cubit.dart';

class FoldersForm extends StatelessWidget {
  const FoldersForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = FoldersCubit.get(context);
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8).r,
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.philippineSilver),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.profile_photos.tr(),
                          style: AppTextStyles.font14GrayMedium.copyWith(
                            color: AppColors.darkLiver,
                          ),
                        ),
                        verticalSpace(8),
                        technicalPhotos(),
                      ],
                    ),
                  ),
                ),
                verticalSpace(8),
                CustomMessageTextFormField(
                  hint: LocaleKeys.profile_aboutYou.tr(),
                  labelText: LocaleKeys.profile_aboutYou.tr(),
                  controller: cubit.messageController,
                ),
              ],
            ),
          ),
          Expanded(child: verticalSpace(50)),
          CustomBottomButton(
            onPressed: () {},
            textButton: LocaleKeys.save.tr(),
          ),
        ],
      ),
    );
  }

  Widget customImage() {
    return Container(
      width: 71.w,
      height: 74.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        image: DecorationImage(
          image: AssetImage(AppImages.fakePhotoImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: AppColors.black.withValues(alpha: 0.6),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(AppImages.closeIcon, fit: BoxFit.scaleDown),
          ),
        ),
      ),
    );
  }

  Widget customPlus() {
    return Container(
      width: 71.w,
      height: 74.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        border: Border.all(color: AppColors.darkBlue),
      ),
      child: Center(
        child: Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: AppColors.darkBlue.withValues(alpha: 0.6),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              AppImages.addIcon,
              fit: BoxFit.scaleDown,
              colorFilter: const ColorFilter.mode(
                AppColors.white, // 🔵 Desired color
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget technicalPhotos() {
    // Example: List of technical photos (you can replace with your actual list)
    List<String> technicalPhotosList = []; // For testing less than 3

    // Calculate how many actual photo widgets
    int photoCount = technicalPhotosList.length;

    // Build a list of photo widgets
    List<Widget> photoWidgets = technicalPhotosList
        .map((_) => customImage())
        .toList();

    // If less than 3, add a "+" widget
    if (photoCount < 3) {
      photoWidgets.add(customPlus());
    }

    return SizedBox(
      height: 75.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => photoWidgets[index],
        separatorBuilder: (context, index) => horizontalSpace(8),
        itemCount: photoWidgets.length,
      ),
    );
  }
}
