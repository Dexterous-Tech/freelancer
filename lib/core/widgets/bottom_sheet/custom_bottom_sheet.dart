import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/spacing.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.bottomSheetContent});

  final Widget bottomSheetContent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior
            .translucent, // Ensures taps are detected on empty space
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32).r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: Center(
                  child: Container(
                    width: 134.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: AppColors.gainsboro,
                      borderRadius: BorderRadius.circular(100).r,
                    ),
                  ),
                ),
              ),
              verticalSpace(16),
              bottomSheetContent,
            ],
          ),
        ),
      ),
    );
  }
}
