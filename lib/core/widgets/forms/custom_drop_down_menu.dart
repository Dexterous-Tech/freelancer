import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class CustomDropDownMenu extends StatefulWidget {
  final String hint;
  final List<String> items;
  final Function(String?) onChanged;
  final String? initialValue;

  const CustomDropDownMenu({
    super.key,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.initialValue,
  });

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();

    selectedValue =
        (widget.initialValue != null &&
            widget.initialValue!.isNotEmpty &&
            widget.items.contains(widget.initialValue))
        ? widget.initialValue
        : null;
  }

  @override
  void didUpdateWidget(CustomDropDownMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue ||
        oldWidget.items != widget.items) {
      setState(() {
        selectedValue =
            (widget.initialValue != null &&
                widget.initialValue!.isNotEmpty &&
                widget.items.contains(widget.initialValue))
            ? widget.initialValue
            : null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.philippineSilver),
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: SvgPicture.asset(
            AppImages.arrowDownGrayIcon,
            width: 22.w,
            height: 22.h,
          ),
          isExpanded: true,
          value: selectedValue,
          dropdownColor: Colors.white,
          hint: Text(widget.hint, style: AppTextStyles.font14GrayMedium),
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  value,
                  style: AppTextStyles.font14BlackRegular.copyWith(
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
            widget.onChanged(newValue);
          },
        ),
      ),
    );
  }
}
