import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/forms/custom_elevated_button.dart';

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({
    super.key,
    this.textButton,
    this.onPressed,
    this.isMore = false,
    this.firstButtonOnPressed,
    this.secondButtonOnPressed,
    this.firstButtonColor,
    this.secondButtonColor,
    this.firstButtonText,
    this.secondButtonText,
    this.firstButtonTextStyle,
    this.secondButtonTextStyle,
    this.buttonColor,
    this.buttonTextStyle,
    this.isLoading = false,
  });

  final String? textButton;
  final void Function()? onPressed;
  final void Function()? firstButtonOnPressed;
  final void Function()? secondButtonOnPressed;
  final Color? firstButtonColor;
  final Color? secondButtonColor;
  final String? firstButtonText;
  final String? secondButtonText;
  final TextStyle? firstButtonTextStyle;
  final TextStyle? secondButtonTextStyle;
  final bool isMore;
  final Color? buttonColor;
  final TextStyle? buttonTextStyle;
  final bool isLoading;
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
      child: isMore
          ? isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: AppColors.darkBlue),
                  )
                : Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: firstButtonOnPressed ?? () {},
                          textButton: firstButtonText,
                          backgroundColor: firstButtonColor,
                          styleTextButton: firstButtonTextStyle,
                        ),
                      ),
                      horizontalSpace(10),
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: secondButtonOnPressed ?? () {},
                          textButton: secondButtonText,
                          backgroundColor: secondButtonColor,
                          styleTextButton: secondButtonTextStyle,
                        ),
                      ),
                    ],
                  )
          : Center(
              child: CustomElevatedButton(
                onPressed: onPressed ?? () {},
                textButton: textButton,
                backgroundColor: buttonColor,
                styleTextButton: buttonTextStyle,
                buttonWidget: isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.yellow,
                        ),
                      )
                    : null,
              ),
            ),
    );
  }
}
