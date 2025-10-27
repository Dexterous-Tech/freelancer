import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/theme/app_text_styles.dart';

class MainHomeBottomNavigationBar extends StatefulWidget {
  const MainHomeBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  @override
  State<MainHomeBottomNavigationBar> createState() =>
      _MainHomeBottomNavigationBarState();
}

class _MainHomeBottomNavigationBarState
    extends State<MainHomeBottomNavigationBar> {
  int currentSelectedIndex = 0;
  @override
  void initState() {
    super.initState();
    currentSelectedIndex = widget.selectedIndex;
  }

  void onTabChanged(int index) {
    HapticFeedback.lightImpact();
    widget.onTabChanged(index); // 👈 only notify parent
  }

  @override
  void didUpdateWidget(covariant MainHomeBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      setState(() {
        currentSelectedIndex = widget.selectedIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8).r,
          topRight: Radius.circular(8).r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 2,
            offset: const Offset(0, -2),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(
              icon: currentSelectedIndex == 0
                  ? AppImages.homeBlueIcon
                  : AppImages.homeGrayIcon,
              label: LocaleKeys.bottomNavigationBar_home.tr(),
              isSelected: currentSelectedIndex == 0,
              onTap: () => onTabChanged(0),
            ),
            _buildNavItem(
              icon: currentSelectedIndex == 1
                  ? AppImages.profileBlueIcon
                  : AppImages.profileGrayIcon,
              label: LocaleKeys.bottomNavigationBar_profile.tr(),
              isSelected: currentSelectedIndex == 1,
              onTap: () => onTabChanged(1),
            ),
            _buildNavItem(
              icon: currentSelectedIndex == 2
                  ? AppImages.servicesBlueIcon
                  : AppImages.servicesGrayIcon,
              label: LocaleKeys.bottomNavigationBar_services.tr(),
              isSelected: currentSelectedIndex == 2,
              onTap: () => onTabChanged(2),
            ),
            _buildNavItem(
              icon: currentSelectedIndex == 3
                  ? AppImages.moreBlueIcon
                  : AppImages.moreGrayIcon,
              label: LocaleKeys.bottomNavigationBar_more.tr(),
              isSelected: currentSelectedIndex == 3,
              onTap: () => onTabChanged(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        splashColor: AppColors.darkBlue.withValues(alpha: 0.1),
        highlightColor: AppColors.darkBlue.withValues(alpha: 0.05),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: isSelected ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                        );
                      },
                  child: SvgPicture.asset(
                    icon,
                    key: ValueKey(icon),
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
              verticalSpace(6),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                style: isSelected
                    ? AppTextStyles.font12DarkBlueRegular
                    : AppTextStyles.font12DarkBlueRegular.copyWith(
                        color: AppColors.gray,
                      ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
