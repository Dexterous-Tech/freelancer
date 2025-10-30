import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'dart:ui';

import '../../../core/shared/shared_preferences_helper.dart';
import '../../../core/shared/shared_preferences_key.dart'; // for ImageFilter

class ServiceProviderItem extends StatelessWidget {
  const ServiceProviderItem({
    super.key,
    this.isSpecial = false,
    this.isRead = false,
    this.isFav = false,
  });

  final bool isSpecial;
  final bool isRead;
  final bool isFav;

  Future<void> _handleTap(BuildContext context) async {
    final isLogin =
        await SharedPreferencesHelper.getBool(SharedPreferencesKey.isLogging) ??
        false;

    if (isLogin) {
      if (context.mounted) {
        context.pushNamed(AppRoutes.serviceProviderDetailsScreen, arguments: 1);
      }
    } else {
      Future.wait([
        SharedPreferencesHelper.remove(SharedPreferencesKey.routeAfterLogin),
        SharedPreferencesHelper.setString(
          SharedPreferencesKey.routeAfterLogin,
          AppRoutes
              .serviceProviderDetailsScreen, // or use something like 'tab_1' or AppRoutes.profileScreen
        ),
        SharedPreferencesHelper.setSecuredString(
          SharedPreferencesKey.serviceProviderId,
          '1',
        ),
      ]);
      if (context.mounted) {
        context.pushNamed(AppRoutes.loginScreen);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(context),
      child: Container(
        height: 233.h,
        width: double.infinity,
        padding: EdgeInsets.only(top: 8.h, bottom: 4.h, right: 4.w, left: 4.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.serviceProviderImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isSpecial
                    ? customIconContainer(
                        color: AppColors.vividGamboge.withValues(alpha: 0.4),
                        assetName: AppImages.crownIcon,
                      )
                    : SizedBox(width: 36.w, height: 36.h),
                customIconContainer(
                  color: AppColors.black.withValues(alpha: 0.6),
                  assetName: isFav
                      ? AppImages.favFilledIcon
                      : AppImages.favBorderIcon,
                ),
              ],
            ),
            Spacer(),

            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  height: 88.h,
                  padding: EdgeInsetsDirectional.only(
                    start: 16.w,
                    end: 8.w,
                    top: 8.h,
                    bottom: 8.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8).r,
                    color: isRead
                        ? AppColors.black.withValues(alpha: 0.6)
                        : AppColors.darkBlue.withValues(alpha: 0.5),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (isSpecial) ...[
                                SvgPicture.asset(
                                  AppImages.crownIcon,
                                  width: 20.w,
                                  height: 20.w,
                                ),
                                horizontalSpace(8),
                              ],
                              Text(
                                'Provider name',
                                style: AppTextStyles.font16JetMedium.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppImages.jobIcon,
                                width: 16.w,
                                height: 16.w,
                              ),
                              horizontalSpace(8),
                              Text(
                                'Provider job',
                                style: AppTextStyles.font14GrayMedium.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppImages.locationWhiteIcon,
                                width: 16.w,
                                height: 16.w,
                              ),
                              horizontalSpace(8),
                              Text(
                                'Provider location',
                                style: AppTextStyles.font12DarkBlueMedium
                                    .copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '4.7',
                            style: AppTextStyles.font12OuterSpaceSemiBold
                                .copyWith(color: AppColors.antiFlashWhite),
                          ),
                          horizontalSpace(8),
                          SvgPicture.asset(
                            AppImages.starBorderIcon,
                            width: 20.w,
                            height: 20.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customIconContainer({
    required Color color,
    required String assetName,
  }) {
    return Container(
      width: 36.w,
      height: 36.h,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: SvgPicture.asset(assetName, width: 20.w, height: 20.h),
      ),
    );
  }
}
