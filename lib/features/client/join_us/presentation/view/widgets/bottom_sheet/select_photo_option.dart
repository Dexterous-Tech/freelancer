import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/features/client/join_us/presentation/manager/join_us_cubit.dart';

import '../../../../../../../core/di/injection_container.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/spacing.dart';
import '../../../../../../../core/widgets/custom_bottom_button.dart';
import '../../../../../../../generated/locale_keys.g.dart';

class SelectPhotoOption extends StatelessWidget {
  const SelectPhotoOption({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<JoinUsCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.authentication_yourPhoto.tr(),
                  style: AppTextStyles.font24WhiteMedium.copyWith(
                    color: AppColors.charlestonGreen,
                  ),
                ),
                verticalSpace(8),
                Text(
                  LocaleKeys.authentication_addProfilePicture.tr(),
                  style: AppTextStyles.font14OuterSpaceMedium,
                ),
                verticalSpace(25),
              ],
            ),
          ),
          BlocConsumer<JoinUsCubit, JoinUsState>(
            buildWhen: (context, state) =>
                state is JoinMyImageSelected || state is JoinMyImageFailure,
            listenWhen: (context, state) =>
                state is JoinMyImageSelected || state is JoinMyImageFailure,
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = JoinUsCubit.get(context);
              return CustomBottomButton(
                isMore: true,
                firstButtonColor: AppColors.darkBlue,
                secondButtonColor: AppColors.antiFlashWhite,
                firstButtonText: LocaleKeys.authentication_takePhotoCamera.tr(),
                secondButtonText: LocaleKeys.authentication_chooseFromGallery
                    .tr(),
                firstButtonTextStyle: AppTextStyles.font18YellowRegular,
                secondButtonTextStyle: AppTextStyles.font18YellowRegular
                    .copyWith(color: AppColors.darkBlue),
                firstButtonOnPressed: () {
                  context.pop();
                  cubit.pickImageFromCamera();
                },
                secondButtonOnPressed: () {
                  context.pop();
                  cubit.pickImageFromGallery();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
