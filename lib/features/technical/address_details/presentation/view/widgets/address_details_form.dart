import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_bottom_button.dart';
import 'package:freelancer/core/widgets/forms/custom_drop_down_menu.dart';
import 'package:freelancer/features/auth/widgets/custom_message_text_form_field.dart';
import 'package:freelancer/features/technical/address_details/presentation/manager/address_details_cubit.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class AddressDetailsForm extends StatelessWidget {
  const AddressDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AddressDetailsCubit.get(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropDownMenu(
                  hint: LocaleKeys.profile_city.tr(),
                  items: ['1', '2', '3'],
                  onChanged: (value) {},
                  initialValue: cubit.cityController.text,
                ),
                verticalSpace(8),
                CustomDropDownMenu(
                  hint: LocaleKeys.profile_street.tr(),
                  items: ['1', '2', '3'],
                  onChanged: (value) {},
                  initialValue: cubit.streetController.text,
                ),
                verticalSpace(8),
                CustomMessageTextFormField(
                  hint: LocaleKeys.profile_placeDetails.tr(),
                  controller: cubit.detailsController,
                ),
                verticalSpace(8),
                Text(
                  LocaleKeys.profile_placeInMap.tr(),
                  style: AppTextStyles.font14DarkLiverMedium.copyWith(
                    color: AppColors.outerSpace,
                  ),
                ),
                verticalSpace(8),
                Image.asset(
                  AppImages.fakeMap2Image,
                  width: double.infinity,
                  height: 132.h,
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
}
