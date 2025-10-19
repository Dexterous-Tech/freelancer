import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/widgets/bottom_sheet/custom_bottom_sheet.dart';

void openBottomSheet({
  required BuildContext context,
  required Widget bottomSheetContent,
}) {
  showModalBottomSheet(
    context: context,
    barrierLabel: "BottomSheet",
    backgroundColor: Colors.transparent,
    isScrollControlled: true, // 👈 very important
    useSafeArea: true, // 👈 prevents overlap with system insets
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32).r),
    ),
    barrierColor: AppColors.black.withValues(alpha: 0.6),
    builder: (context) {
      return CustomBottomSheet(bottomSheetContent: bottomSheetContent);
    },
  );
}
