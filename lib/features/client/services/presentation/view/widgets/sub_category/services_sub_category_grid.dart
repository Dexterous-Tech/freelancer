import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'services_sub_category_item.dart';

class ServicesSubCategoryGrid extends StatelessWidget {
  const ServicesSubCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 18,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 8.w,
      ),
      itemBuilder: (context, index) {
        return ServicesSubCategoryItem();
      },
    );
  }
}
