import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/shared/shared_preferences_helper.dart';
import 'package:freelancer/core/shared/shared_preferences_key.dart';
import 'package:freelancer/features/common/profile/presentation/view/widgets/bottom_sheets/current_location_bottom_sheet.dart';
import 'package:freelancer/features/common/profile/presentation/view/widgets/profile_custom_switch.dart';
import '../../../../../../core/helper/app_images.dart';
import '../../../../../../core/helper/extensions.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/spacing.dart';
import '../../../../../../core/widgets/bottom_sheet/open_bottom_sheet.dart';
import '../../../../widgets/profile_content_item.dart';
import '../../manager/profile_cubit.dart';
import 'bottom_sheets/logout_bottom_sheet.dart';
import 'profile_account_logo.dart';
import '../../../../../../generated/locale_keys.g.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  Future<bool> isTechnical() async {
    final isTechnical = await SharedPreferencesHelper.getBool(
      SharedPreferencesKey.isTechnical,
    );

    return isTechnical ?? false;
  }

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
            FutureBuilder<bool>(
              future: isTechnical(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  // while loading, show a placeholder or spinner
                  return const SizedBox.shrink();
                }

                final isTechnical = snapshot.data ?? false;

                if (isTechnical) {
                  // technical view
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRoutes.addressDetailsScreen);
                        },
                        child: ProfileContentItem(
                          icon: AppImages.locationIcon,
                          title: LocaleKeys.profile_addressDetails.tr(),
                        ),
                      ),
                      ProfileContentItem(
                        icon: AppImages.currentLocationIcon,
                        title: LocaleKeys.profile_currentLocation.tr(),
                        leading: ProfileCustomSwitch(
                          onChanged: (value) {
                            openBottomSheet(
                              context: context,
                              bottomSheetContent: CurrentLocationBottomSheet(),
                            );
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRoutes.foldersScreen);
                        },
                        child: ProfileContentItem(
                          icon: AppImages.foldersIcon,
                          title: LocaleKeys.profile_folders.tr(),
                          isDivider: false,
                        ),
                      ),
                    ],
                  );
                } else {
                  // client view
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileContentItem(
                        icon: AppImages.heartIcon,
                        title: LocaleKeys.profile_fav.tr(),
                      ),
                      BlocBuilder<ProfileCubit, ProfileState>(
                        buildWhen: (context, state) =>
                            state is ProfileGetProfileSuccess ||
                            state is ProfileGetProfileFailure ||
                            state is ProfileGetProfileLoading,
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              context.pushNamed(AppRoutes.joinUsScreen);
                            },
                            child: ProfileContentItem(
                              icon: AppImages.joinServiceIcon,
                              title: LocaleKeys.profile_joinService.tr(),
                              isDivider: false,
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }
              },
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
