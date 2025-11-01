import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/widgets/custom_bottom_button.dart';
import 'package:freelancer/core/widgets/forms/custom_drop_down_menu.dart';
import 'package:freelancer/core/widgets/forms/custom_text_form_field.dart';
import 'package:freelancer/features/common/edit_profile/presentation/manager/edit_profile_cubit.dart';

import '../../../../../../../core/di/injection_container.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/spacing.dart';
import '../../../../../../../generated/locale_keys.g.dart';

class SocialMediaBottomSheet extends StatelessWidget {
  const SocialMediaBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<EditProfileCubit>(),
      child: Builder(
        builder: (context) {
          final cubit = EditProfileCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.profile_socialMediaTitle.tr(),
                      style: AppTextStyles.font20YellowMedium.copyWith(
                        color: AppColors.jet,
                      ),
                    ),
                    verticalSpace(8),
                    Text(
                      LocaleKeys.profile_socialMediaSubtitle.tr(),
                      style: AppTextStyles.font14OuterSpaceMedium.copyWith(
                        color: AppColors.davyGrey,
                      ),
                    ),
                    verticalSpace(24),
                    CustomDropDownMenu(
                      hint: LocaleKeys.profile_socialMediaTitle.tr(),
                      items: ['category 1', 'category 1', 'category 1'],
                      onChanged: (value) {
                        cubit.socialMediaTypeController.text = value!;
                      },
                      initialValue: cubit.socialMediaTypeController.text,
                    ),
                    verticalSpace(16),
                    CustomTextFormField(
                      hintText: LocaleKeys.profile_addSocialMediaLink.tr(),
                      validator: (value) {},
                      controller: cubit.socialMediaLinkController,
                    ),
                    verticalSpace(8),
                  ],
                ),
              ),
              CustomBottomButton(onPressed: () {}, textButton: LocaleKeys.save),
            ],
          );
        },
      ),
    );
  }
}
