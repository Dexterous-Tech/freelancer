import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'services_sub_category_item.dart';

class ServicesSubCategoryGrid extends StatelessWidget {
  const ServicesSubCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: 18,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 168 / 108,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: const ServicesSubCategoryItem(),
          );
        },
      ),
    );
  }
}
