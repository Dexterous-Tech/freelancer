import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'font_family_helper.dart';
import 'font_weight_helper.dart';

class AppTextStyles {
  static TextStyle font14BlackRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.black,
    fontFamily: FontFamilyHelper.iBMPlexSansArabic,
  );

  static TextStyle font16DarkBlueRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.darkBlue,
    fontFamily: FontFamilyHelper.iBMPlexSansArabic,
  );

  static TextStyle font16BlackSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.black,
    fontFamily: FontFamilyHelper.iBMPlexSansArabic,
  );

  static TextStyle font18YellowRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.yellow,
    fontFamily: FontFamilyHelper.iBMPlexSansArabic,
  );

  static TextStyle font14GrayMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.gray,
    fontFamily: FontFamilyHelper.iBMPlexSansArabic,
  );
}
