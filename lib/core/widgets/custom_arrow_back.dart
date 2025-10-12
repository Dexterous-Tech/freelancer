import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
    this.background,
    this.onPressed,
    this.color,
    this.size,
  });

  final Color? background;
  final VoidCallback? onPressed;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          try {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              if (Navigator.of(context, rootNavigator: true).canPop()) {
                Navigator.of(context, rootNavigator: true).pop();
              } else {}
            }
          } catch (e) {
            if (kDebugMode) {
              print('CustomArrowBack: Navigation error: $e');
            }
          }
        }
      },
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: background ?? Colors.transparent,
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back,
            color: color ?? Colors.black,
            size: size ?? 20,
          ),
        ),
      ),
    );
  }
}
