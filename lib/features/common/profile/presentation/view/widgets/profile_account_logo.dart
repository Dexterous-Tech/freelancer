import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer/features/common/profile/presentation/manager/profile_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/helper/app_images.dart';
import '../../../../../../core/helper/functions.dart';
import '../../../../../../core/shared/shared_preferences_helper.dart';
import '../../../../../../core/shared/shared_preferences_key.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/font_weight_helper.dart';
import '../../../../../../core/theme/spacing.dart';
import '../../../../../../core/widgets/animated_switcher_wrapper.dart';
import '../../../../../../core/widgets/bottom_sheet/open_bottom_sheet.dart';
import 'bottom_sheets/switch_account_bottom_sheet.dart';

class ProfileAccountLogo extends StatefulWidget {
  const ProfileAccountLogo({super.key});

  @override
  State<ProfileAccountLogo> createState() => _ProfileAccountLogoState();
}

class _ProfileAccountLogoState extends State<ProfileAccountLogo> {
  @override
  void initState() {
    super.initState();
    ProfileCubit.get(context).getProfile();
  }

  Future<bool> isTechnical() async {
    final isTechnical = await SharedPreferencesHelper.getBool(
      SharedPreferencesKey.isTechnical,
    );

    return isTechnical ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final isLoading = state is ProfileGetProfileLoading;

        final loadingSkeleton = Skeletonizer.zone(
          child: Row(
            children: [
              Bone.circle(size: 48),
              horizontalSpace(8),
              Bone.text(width: 100),
              const Spacer(),
              Bone.icon(),
            ],
          ),
        );

        if (state is ProfileGetProfileSuccess) {
          final name =
              '${state.profileResponseModel.data?.firstName ?? ''} ${state.profileResponseModel.data?.lastName ?? ''}';
          final initials = getInitials(name);

          final content = GestureDetector(
            onTap: () {
              openBottomSheet(
                context: context,
                bottomSheetContent: SwitchAccountBottomSheet(
                  profileDataModel: state.profileResponseModel.data!,
                ),
              );
            },
            child: Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: const BoxDecoration(
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppTextStyles.font18YellowRegular.copyWith(
                          color: AppColors.jet,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(8),
                      FutureBuilder<bool>(
                        future: isTechnical(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            // while loading, show a placeholder or spinner
                            return const SizedBox.shrink();
                          }

                          final isTechnical = snapshot.data ?? false;
                          if (isTechnical) {
                            return FittedBox(child: jobItem());
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                horizontalSpace(12),
                SvgPicture.asset(
                  AppImages.arrowDownIcon,
                  width: 24.w,
                  height: 24.h,
                ),
              ],
            ),
          );

          return AnimatedSwitcherWrapper(
            isLoading: isLoading,
            loadingWidget: loadingSkeleton,
            child: content,
          );
        }

        // Default to skeleton if not loaded yet
        return AnimatedSwitcherWrapper(
          isLoading: true,
          loadingWidget: loadingSkeleton,
          child: const SizedBox.shrink(),
        );
      },
    );
  }

  Widget jobItem() {
    return Container(
      height: 26.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        color: AppColors.cultured,
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.jobIcon, width: 16.w, height: 16.h),
          horizontalSpace(4),
          Text(
            'سباك صحي',
            style: AppTextStyles.font12DarkBlueMedium.copyWith(
              color: AppColors.outerSpace,
            ),
          ),
        ],
      ),
    );
  }
}
