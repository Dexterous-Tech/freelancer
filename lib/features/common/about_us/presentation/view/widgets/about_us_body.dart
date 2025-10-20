import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/font_weight_helper.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_container_data.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'package:freelancer/core/widgets/forms/custom_elevated_button.dart';
import 'package:freelancer/generated/locale_keys.g.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../manager/about_us_cubit.dart';

class AboutUsBody extends StatefulWidget {
  const AboutUsBody({super.key});

  @override
  State<AboutUsBody> createState() => _AboutUsBodyState();
}

class _AboutUsBodyState extends State<AboutUsBody> {
  @override
  void initState() {
    super.initState();
    AboutUsCubit.get(context).aboutUs();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(title: LocaleKeys.more_aboutUS.tr()),
        verticalSpace(16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: BlocBuilder<AboutUsCubit, AboutUsState>(
            buildWhen: (context, state) =>
                state is AboutUsSuccess ||
                state is AboutUsLoading ||
                state is AboutUsFailure,
            builder: (context, state) {
              if (state is AboutUsSuccess) {
                return CustomContainerData(
                  // ✅ The container takes available height
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Html(
                          data:
                              state.settingsResponseModel.data?.description ??
                              '',
                          style: {
                            "body": Style(
                              fontSize: FontSize(14.sp),
                              color: AppColors.jet,
                              fontWeight: FontWeightHelper.regular,
                            ),
                          },
                        ),
                      );
                    },
                  ),
                );
              } else if (state is AboutUsFailure) {
                return CustomContainerData(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.error,
                        style: AppTextStyles.font18WhiteMedium.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                      verticalSpace(16),
                      CustomElevatedButton(
                        onPressed: () {
                          AboutUsCubit.get(context).aboutUs();
                        },
                        textButton: LocaleKeys.tryAgain.tr(),
                      ),
                    ],
                  ),
                );
              }

              // Loading skeleton
              return CustomContainerData(
                child: Skeletonizer(
                  enabled: state is AboutUsLoading,
                  justifyMultiLineText: true,
                  textBoneBorderRadius: TextBoneBorderRadius.fromHeightFactor(
                    .5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Bone.text(),
                      verticalSpace(12),
                      Bone.text(),
                      verticalSpace(12),
                      Bone.text(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
