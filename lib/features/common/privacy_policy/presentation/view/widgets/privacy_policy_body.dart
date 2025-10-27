import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_container_data.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'package:freelancer/generated/locale_keys.g.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/theme/font_weight_helper.dart';
import '../../../../../../core/widgets/forms/custom_elevated_button.dart';
import '../../manager/privacy_policy_cubit.dart';

class PrivacyPolicyBody extends StatefulWidget {
  const PrivacyPolicyBody({super.key});

  @override
  State<PrivacyPolicyBody> createState() => _PrivacyPolicyBodyState();
}

class _PrivacyPolicyBodyState extends State<PrivacyPolicyBody> {
  @override
  void initState() {
    super.initState();
    PrivacyPolicyCubit.get(context).privacyPolicy();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(title: LocaleKeys.more_privacyPolicy.tr()),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyState>(
              buildWhen: (context, state) =>
                  state is PrivacyPolicySuccess ||
                  state is PrivacyPolicyLoading ||
                  state is PrivacyPolicyFailure,
              builder: (context, state) {
                if (state is PrivacyPolicySuccess) {
                  return CustomContainerData(
                    // ✅ The container takes available height
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          height: constraints.maxHeight,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child:
                                state.settingsResponseModel.data!.description
                                    .isNullOrEmpty()
                                ? Text(
                                    LocaleKeys.more_noAvilableData.tr(),
                                    style: AppTextStyles.font16JetMedium,
                                  )
                                : Html(
                                    data:
                                        state
                                            .settingsResponseModel
                                            .data
                                            ?.description ??
                                        '',
                                    style: {
                                      "body": Style(
                                        fontSize: FontSize(14.sp),
                                        color: AppColors.jet,
                                        fontWeight: FontWeightHelper.regular,
                                      ),
                                    },
                                  ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is PrivacyPolicyFailure) {
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
                            PrivacyPolicyCubit.get(context).privacyPolicy();
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
                    enabled: state is PrivacyPolicyLoading,
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
        ),
      ],
    );
  }
}
