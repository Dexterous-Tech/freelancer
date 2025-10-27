import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/widgets/dialog/show_custom_snack_bar.dart';
import 'package:freelancer/features/client/edit_profile/presentation/manager/client_edit_profile_cubit.dart';
import '../../../../../../../core/di/injection_container.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/spacing.dart';
import '../../../../../../../core/widgets/bottom_sheet/error_bottom_sheet.dart';
import '../../../../../../../core/widgets/bottom_sheet/open_bottom_sheet.dart';
import '../../../../../../../core/widgets/custom_bottom_button.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../../../auth/widgets/custom_password_text_form_field.dart';

class PasswordDeleteAccountBottomSheet extends StatefulWidget {
  const PasswordDeleteAccountBottomSheet({super.key});

  @override
  State<PasswordDeleteAccountBottomSheet> createState() =>
      _PasswordDeleteAccountBottomSheetState();
}

class _PasswordDeleteAccountBottomSheetState
    extends State<PasswordDeleteAccountBottomSheet> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ClientEditProfileCubit>(),
      child: BlocConsumer<ClientEditProfileCubit, ClientEditProfileState>(
        listenWhen: (context, state) =>
            state is ProfileDeleteAccountLoading ||
            state is ProfileDeleteAccountFailure ||
            state is ProfileDeleteAccountSuccess ||
            state is ProfileChangeVisiblePassword,
        buildWhen: (context, state) =>
            state is ProfileDeleteAccountLoading ||
            state is ProfileDeleteAccountFailure ||
            state is ProfileDeleteAccountSuccess ||
            state is ProfileChangeVisiblePassword,

        listener: (context, state) {
          if (state is ProfileDeleteAccountFailure) {
            openBottomSheet(
              barrierColor: Colors.transparent,
              context: context,
              bottomSheetContent: ErrorBottomSheet(error: state.error),
            );
          }
          if (state is ProfileDeleteAccountSuccess) {
            showCustomSnackBar(context, state.authActionResponseModel.message);
            context.pushNamedAndRemoveUntil(AppRoutes.languageScreen);
          }
        },
        builder: (context, state) {
          final cubit = ClientEditProfileCubit.get(context);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: cubit.formDeleteKey,
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
                          LocaleKeys.profile_enterPasswordTitle.tr(),
                          style: AppTextStyles.font20YellowMedium.copyWith(
                            color: AppColors.jet,
                          ),
                        ),
                        verticalSpace(8),
                        Text(
                          LocaleKeys.profile_enterPasswordSubtitle.tr(),
                          style: AppTextStyles.font14OuterSpaceMedium.copyWith(
                            color: AppColors.davyGrey,
                          ),
                        ),
                        verticalSpace(24),
                        CustomPasswordTextFormField(
                          passwordController: cubit.passwordController,
                          obscureText: cubit.obscureText,
                          hint: LocaleKeys.authentication_currentPassword.tr(),
                          onToggleVisibility: () {
                            cubit.togglePasswordVisibility();
                          },
                        ),
                        verticalSpace(16),
                      ],
                    ),
                  ),
                  CustomBottomButton(
                    isLoading: state is ProfileDeleteAccountLoading,
                    isMore: true,
                    firstButtonColor: AppColors.cgRed,
                    secondButtonColor: AppColors.aliceBlue,
                    firstButtonText: LocaleKeys.profile_deleteAccount.tr(),
                    secondButtonText: LocaleKeys.back.tr(),
                    firstButtonTextStyle: AppTextStyles.font18WhiteMedium,
                    secondButtonTextStyle: AppTextStyles.font18WhiteMedium
                        .copyWith(color: AppColors.darkBlue),
                    firstButtonOnPressed: () {
                      if (cubit.formDeleteKey.currentState!.validate()) {
                        cubit.deleteAccount();
                      }
                    },
                    secondButtonOnPressed: () {
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
