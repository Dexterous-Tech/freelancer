import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/widgets/forms/custom_elevated_button.dart';

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({super.key, required this.textButton});

  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8).r,
          topRight: Radius.circular(8).r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, -2),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: CustomElevatedButton(onPressed: () {}, textButton: textButton),
      ),
    );
  }
}
