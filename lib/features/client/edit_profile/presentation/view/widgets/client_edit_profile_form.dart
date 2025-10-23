import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/auth/widgets/custom_phone_text_form_field.dart';
import 'package:freelancer/features/client/edit_profile/presentation/manager/client_edit_profile_cubit.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../auth/widgets/custom_first_last_name_text_form_field.dart';
import '../../../../profile/data/models/profile_models.dart';

class ClientEditProfileForm extends StatefulWidget {
  const ClientEditProfileForm({super.key, required this.profileDataModel});

  final ProfileDataModel profileDataModel;
  @override
  State<ClientEditProfileForm> createState() => _ClientEditProfileFormState();
}

class _ClientEditProfileFormState extends State<ClientEditProfileForm> {
  late ProfileDataModel currentProfile;
  @override
  void initState() {
    super.initState();
    currentProfile = widget.profileDataModel;
    final cubit = ClientEditProfileCubit.get(context);
    cubit.firstNameController.text = currentProfile.firstName;
    cubit.lastNameController.text = currentProfile.lastName;
    cubit.countryCodeController.text = currentProfile.countryCode;
    cubit.phoneNumberController.text = currentProfile.phone;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = ClientEditProfileCubit.get(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  CustomFirstLastNameTextFormField(
                    firstNameController: cubit.firstNameController,
                    secondNameController: cubit.lastNameController,
                  ),
                  verticalSpace(8),
                  CustomPhoneTextFormField(
                    labelText: LocaleKeys.authentication_phoneNumber.tr(),
                    countryCodeController: cubit.countryCodeController,
                    phoneNumberController: cubit.phoneNumberController,
                  ),
                  verticalSpace(24),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.clientChangePasswordScreen);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.lockIcon,
                          width: 24.w,
                          height: 24.h,
                        ),
                        horizontalSpace(4),
                        Text(
                          LocaleKeys.profile_changePassword.tr(),
                          style: AppTextStyles.font18YellowRegular.copyWith(
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
