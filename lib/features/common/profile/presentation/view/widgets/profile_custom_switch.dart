import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/theme/app_colors.dart';

class ProfileCustomSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const ProfileCustomSwitch({
    super.key,
    this.initialValue = false,
    this.onChanged,
  });

  @override
  State<ProfileCustomSwitch> createState() => _ProfileCustomSwitchState();
}

class _ProfileCustomSwitchState extends State<ProfileCustomSwitch> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.initialValue;
  }

  void toggleSwitch() {
    setState(() {
      isActive = !isActive;
    });
    widget.onChanged?.call(isActive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSwitch,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 40.w,
        height: 24.h,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: isActive ? AppColors.darkBlue : AppColors.philippineSilver,
          borderRadius: BorderRadius.circular(50).r,
        ),
        alignment: isActive ? Alignment.centerRight : Alignment.centerLeft,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.3),
                offset: Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.06),
                offset: Offset(0, 2),
                blurRadius: 10,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.02),
                offset: Offset(0, 0),
                blurRadius: 5,
                spreadRadius: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
