import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer/features/client/profile/presentation/manager/profile_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/helper/app_images.dart';
import '../../../../../../core/helper/functions.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/font_weight_helper.dart';
import '../../../../../../core/theme/spacing.dart';
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
    ProfileCubit.get(context).getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileGetProfileSuccess) {
          String name =
              '${state.profileResponseModel.data?.firstName ?? ''} ${state.profileResponseModel.data?.lastName ?? ''}';
          String initials = getInitials(name);
          return GestureDetector(
            onTap: () {
              openBottomSheet(
                context: context,
                bottomSheetContent: SwitchAccountBottomSheet(),
              );
            },
            child: Skeletonizer(
              enabled: state is ProfileGetProfileLoading,
              child: Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
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
                  Text(
                    name,
                    style: AppTextStyles.font18YellowRegular.copyWith(
                      color: AppColors.jet,
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    AppImages.arrowDownIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                ],
              ),
            ),
          );
        }
        return Skeletonizer.zone(
          child: Row(
            children: [
              Bone.circle(size: 48),
              horizontalSpace(8),
              Bone.text(),
              Spacer(),
              Bone.icon(),
            ],
          ),
        );
      },
    );
  }
}
