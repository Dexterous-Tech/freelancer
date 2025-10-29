import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/client/widgets/services_category_item.dart';

class ServicesFavouriteCategoriesList extends StatefulWidget {
  const ServicesFavouriteCategoriesList({super.key});

  @override
  State<ServicesFavouriteCategoriesList> createState() =>
      _ServicesFavouriteCategoriesList();
}

class _ServicesFavouriteCategoriesList
    extends State<ServicesFavouriteCategoriesList> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: SizedBox(
        height: 36.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ServicesCategoryItem(
              isIcon: false,
              isActive: selectedIndex == index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            );
          },
          separatorBuilder: (context, index) => horizontalSpace(4),
          itemCount: 3,
        ),
      ),
    );
  }
}
