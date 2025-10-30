import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/helper/app_images.dart';
import '../../../../../../core/helper/extensions.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/spacing.dart';
import '../../../../../../core/widgets/bottom_sheet/open_bottom_sheet.dart';
import '../../manager/profile_cubit.dart';
import 'bottom_sheets/logout_bottom_sheet.dart';
import 'profile_account_logo.dart';
import '../../../../widgets/profile_content_item.dart';
import '../../../../../../generated/locale_keys.g.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileAccountLogo(),
            verticalSpace(32),
            Text(
              LocaleKeys.profile_basicInformation.tr(),
              style: AppTextStyles.font12OuterSpaceSemiBold,
            ),
            verticalSpace(28),
            BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (context, state) =>
                  state is ProfileGetProfileSuccess ||
                  state is ProfileGetProfileFailure ||
                  state is ProfileGetProfileLoading,
              builder: (context, state) {
                return GestureDetector(
                  onTap: () async {
                    if (state is ProfileGetProfileSuccess) {
                      final result = await context.pushNamed(
                        AppRoutes.clientEditProfileScreen,
                        arguments: state.profileResponseModel.data,
                      );

                      // 🔁 Check if edit was successful and reload profile
                      if (result == true && context.mounted) {
                        ProfileCubit.get(context).getProfile();
                      }
                    }
                  },

                  child: ProfileContentItem(
                    icon: AppImages.profileIcon,
                    title: LocaleKeys.profile_editProfile.tr(),
                  ),
                );
              },
            ),
            ProfileContentItem(
              icon: AppImages.locationIcon,
              title: LocaleKeys.profile_location.tr(),
            ),
            ProfileContentItem(
              icon: AppImages.heartIcon,
              title: LocaleKeys.profile_fav.tr(),
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.joinUsScreen);
              },
              child: ProfileContentItem(
                icon: AppImages.joinServiceIcon,
                title: LocaleKeys.profile_joinService.tr(),
                isDivider: false,
              ),
            ),
            verticalSpace(52),
            Text(
              LocaleKeys.profile_exitApp.tr(),
              style: AppTextStyles.font12OuterSpaceSemiBold,
            ),
            verticalSpace(28),

            GestureDetector(
              onTap: () {
                openBottomSheet(
                  context: context,
                  bottomSheetContent: LogoutBottomSheet(),
                );
              },
              child: ProfileContentItem(
                isDivider: false,
                icon: AppImages.logoutIcon,
                title: LocaleKeys.profile_logout.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
