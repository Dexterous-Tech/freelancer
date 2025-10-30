import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/generated/locale_keys.g.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class CustomUploadFile extends StatelessWidget {
  const CustomUploadFile({
    super.key,
    required this.isUpload,
    required this.fileName,
  });

  final bool isUpload;
  final String fileName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: [8, 4],
          strokeWidth: 1,
          padding: EdgeInsets.symmetric(vertical: 27.w, horizontal: 16.h),
          radius: Radius.circular(16).r,
          color: isUpload ? AppColors.darkBlue : AppColors.philippineSilver,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.uploadImageIcon,
                width: 32.w,
                height: 32.h,
              ),
              verticalSpace(8),
              Text(
                isUpload
                    ? fileName
                    : LocaleKeys.authentication_uploadPersonalPhoto.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.font12DarkBlueRegular.copyWith(
                  color: AppColors.graniteGray,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
