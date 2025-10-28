import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/client/services/presentation/view/widgets/search/service_header_search.dart';
import 'package:freelancer/features/client/services/presentation/view/widgets/category/services_categories_list.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../../core/theme/app_colors.dart';

class ServicesHeader extends StatelessWidget {
  const ServicesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, -3),
          end: Alignment(0, 0),
          colors: [AppColors.yellow, AppColors.white],
          stops: [0.0, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24).r,
          bottomRight: Radius.circular(24).r,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                LocaleKeys.bottomNavigationBar_services.tr(),
                style: AppTextStyles.font16JetMedium,
              ),
            ),
            verticalSpace(16),
            ServiceHeaderSearch(),
            verticalSpace(16),
            ServicesCategoriesList(),
          ],
        ),
      ),
    );
  }
}
