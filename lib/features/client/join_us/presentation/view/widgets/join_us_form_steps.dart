import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/services/localization_service.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_bottom_button.dart';
import 'package:freelancer/core/widgets/custom_page_view.dart';
import 'package:freelancer/features/client/join_us/presentation/manager/join_us_cubit.dart';
import 'package:freelancer/features/client/join_us/presentation/view/widgets/first_form/join_us_first_form.dart';
import 'package:freelancer/generated/locale_keys.g.dart';
import 'second_form/join_us_second_form.dart';
import 'join_us_stepper.dart';

class JoinUsFormSteps extends StatefulWidget {
  const JoinUsFormSteps({super.key});

  @override
  State<JoinUsFormSteps> createState() => _JoinUsFormStepsState();
}

class _JoinUsFormStepsState extends State<JoinUsFormSteps>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        isFirst = tabController.index == 0;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = JoinUsCubit.get(context);
    return Column(
      children: [
        // Stepper and forms with same padding
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                JoinUsStepper(isFirstStep: isFirst),
                Expanded(
                  child: CustomPageView(
                    tabController: tabController,
                    taps: [1, 2],
                    pages: (index) {
                      if (index == 0) return JoinUsFirstForm();
                      return JoinUsSecondForm();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // Button at the bottom without padding (after spacer)
        CustomBottomButton(
          onPressed: () {
            if (isFirst) {
              if (cubit.firstFormKey.currentState!.validate()) {
                tabController.animateTo(1);
              }
            } else {
              if (cubit.secondFormKey.currentState!.validate()) {}
            }
          },
          textButton: LocaleKeys.send.tr(),
          buttonWidget: isFirst
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.next.tr(),
                      style: AppTextStyles.font18YellowRegular,
                    ),
                    horizontalSpace(12),
                    Transform.rotate(
                      angle: LocalizationService.isEnglish(context)
                          ? 0
                          : math.pi,
                      child: SvgPicture.asset(
                        AppImages.arrowRight,
                        colorFilter: const ColorFilter.mode(
                          AppColors.yellow, // 🔵 Desired color
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                )
              : null,
        ),
      ],
    );
  }
}
