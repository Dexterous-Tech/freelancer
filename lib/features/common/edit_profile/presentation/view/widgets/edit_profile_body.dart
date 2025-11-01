import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/common/edit_profile/data/models/update_profile_model.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/widgets/bottom_sheet/correct_bottom_sheet.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import '../../../../../common/profile/data/models/profile_models.dart';
import 'edit_profile_button.dart';
import 'edit_profile_form.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/helper/functions.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/bottom_sheet/error_bottom_sheet.dart';
import '../../../../../../core/widgets/bottom_sheet/open_bottom_sheet.dart';
import '../../manager/edit_profile_cubit.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key, required this.profileDataModel});

  final ProfileDataModel profileDataModel;

  @override
  Widget build(BuildContext context) {
    final name = '${profileDataModel.firstName} ${profileDataModel.lastName}';
    final initials = getInitials(name);

    return BlocListener<EditProfileCubit, EditProfileState>(
      listenWhen: (context, state) =>
          state is EditProfileLoading ||
          state is EditProfileSuccess ||
          state is EditProfileFailure,
      listener: (context, state) {
        if (state is EditProfileFailure) {
          openBottomSheet(
            context: context,
            bottomSheetContent: ErrorBottomSheet(error: state.error),
          );
        }
        if (state is EditProfileSuccess) {
          final cubit = EditProfileCubit.get(context);
          if (state.profileResponseModel.data?.needVerification == 1) {
            openBottomSheet(
              context: context,
              bottomSheetContent: CorrectBottomSheet(
                message: state.profileResponseModel.message,
                textButton: LocaleKeys.authentication_verificationPhoneNumber
                    .tr(),
                onPressed: () {
                  context.pushNamed(
                    AppRoutes.verificationScreen,
                    arguments: VerificationUpdateProfile(
                      oldPhoneNumber:
                          state.profileResponseModel.data?.phone ?? '',
                      oldCountryCode:
                          state.profileResponseModel.data?.countryCode ?? '',
                      countryCode: cubit.countryCodeController.text,
                      phoneNumber: cubit.phoneNumberController.text,
                      needVerification:
                          state.profileResponseModel.data?.needVerification ??
                          0,
                    ),
                  );
                },
              ),
            );
          } else {
            openBottomSheet(
              context: context,
              bottomSheetContent: CorrectBottomSheet(
                message: state.profileResponseModel.message,
                onPressed: () {
                  context.pop();
                  Navigator.pop(context, true);
                },
              ),
            );
          }
        }
      },
      child: Column(
        children: [
          // ✅ Header (outside scroll)
          CustomHeader(title: LocaleKeys.profile_profileTitle.tr()),

          // ✅ Scrollable content
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight:
                          constraints.maxHeight, // 👈 ensures full height
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(24),
                          Center(
                            child: Container(
                              width: 56.w,
                              height: 56.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.darkBlue,
                              ),
                              child: Center(
                                child: Text(
                                  initials,
                                  style: AppTextStyles.font20YellowMedium,
                                ),
                              ),
                            ),
                          ),
                          verticalSpace(8),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Center(
                              child: Text(
                                name,
                                style: AppTextStyles.font24JetRegular,
                                textAlign: TextAlign.center,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          verticalSpace(32),
                          EditProfileForm(profileDataModel: profileDataModel),
                          Expanded(child: verticalSpace(50)),
                          EditProfileButton(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
