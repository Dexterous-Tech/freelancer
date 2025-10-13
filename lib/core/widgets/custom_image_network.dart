import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({
    super.key,
    required this.image,
    this.width,
    this.height,
  });

  final String image;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.cover,
      width: width,
      height: height,
      errorBuilder: (_, __, ___) => Center(
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: Center(child: Icon(Icons.image, color: AppColors.red)),
        ),
      ),
      loadingBuilder: (_, child, progress) => progress == null
          ? child
          : Center(
              child: SizedBox(
                height: 24.h,
                width: 24.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
    );
  }
}
