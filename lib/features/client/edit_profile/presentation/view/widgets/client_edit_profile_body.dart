import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/theme/spacing.dart';
import '../../../../../../core/widgets/bottom_sheet/correct_bottom_sheet.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'client_edit_profile_button.dart';
import 'client_edit_profile_form.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/helper/functions.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/bottom_sheet/error_bottom_sheet.dart';
import '../../../../../../core/widgets/bottom_sheet/open_bottom_sheet.dart';
import '../../../../profile/data/models/profile_models.dart';
import '../../manager/client_edit_profile_cubit.dart';

class ClientEditProfileBody extends StatelessWidget {
  const ClientEditProfileBody({super.key, required this.profileDataModel});

  final ProfileDataModel profileDataModel;

  @override
  Widget build(BuildContext context) {
    final name = '${profileDataModel.firstName} ${profileDataModel.lastName}';
    final initials = getInitials(name);
    return BlocListener<ClientEditProfileCubit, ClientEditProfileState>(
      listenWhen: (context, state) =>
          state is ClientEditProfileLoading ||
          state is ClientEditProfileSuccess ||
          state is ClientEditProfileFailure,
      listener: (context, state) {
        if (state is ClientEditProfileFailure) {
          openBottomSheet(
            context: context,
            bottomSheetContent: ErrorBottomSheet(error: state.error),
          );
        }
        if (state is ClientEditProfileSuccess) {
          openBottomSheet(
            context: context,
            bottomSheetContent: CorrectBottomSheet(
              message: state.profileResponseModel.message,
              onPressed: () {
                context.pop();
                Navigator.pop(context, true);
              },
            ),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeader(title: LocaleKeys.profile_profileTitle.tr()),
          verticalSpace(24),
          Center(
            child: Container(
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.darkBlue,
              ),
              child: Center(
                child: Text(initials, style: AppTextStyles.font20YellowMedium),
              ),
            ),
          ),
          verticalSpace(8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Center(
              child: Text(
                name,
                style: AppTextStyles.font24JetRegular,
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          verticalSpace(32),
          Expanded(
            child: ClientEditProfileForm(profileDataModel: profileDataModel),
          ),
          Expanded(child: verticalSpace(50)),
          ClientEditProfileButton(),
          // Spacer(),
        ],
      ),
    );
  }
}
