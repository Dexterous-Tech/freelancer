import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/auth/widgets/custom_email_text_form_field.dart';
import 'package:freelancer/features/auth/widgets/custom_phone_text_form_field.dart';
import 'package:freelancer/features/common/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:freelancer/features/common/edit_profile/presentation/view/widgets/edit_profile_additional.dart';
import 'package:freelancer/features/common/edit_profile/presentation/view/widgets/edit_profile_social_media.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/shared/shared_preferences_helper.dart';
import '../../../../../../core/shared/shared_preferences_key.dart';
import '../../../../../../core/widgets/bottom_sheet/open_bottom_sheet.dart';
import '../../../../../../core/widgets/forms/custom_drop_down_menu.dart';
import '../../../../../auth/widgets/custom_first_last_name_text_form_field.dart';
import '../../../../../common/profile/data/models/profile_models.dart';
import '../../../../../common/widgets/profile_content_item.dart';
import 'bottom_sheet/delete_account_bottom_sheet.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key, required this.profileDataModel});

  final ProfileDataModel profileDataModel;
  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late ProfileDataModel currentProfile;
  @override
  void initState() {
    super.initState();
    currentProfile = widget.profileDataModel;
    final cubit = EditProfileCubit.get(context);
    cubit.firstNameController.text = currentProfile.firstName;
    cubit.lastNameController.text = currentProfile.lastName;
    cubit.countryCodeController.text = currentProfile.countryCode;
    cubit.phoneNumberController.text = currentProfile.phone;
  }

  Future<bool> isTechnical() async {
    final isTechnical = await SharedPreferencesHelper.getBool(
      SharedPreferencesKey.isTechnical,
    );

    return isTechnical ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = EditProfileCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //name
            CustomFirstLastNameTextFormField(
              firstNameController: cubit.firstNameController,
              secondNameController: cubit.lastNameController,
              labelTextFirst: LocaleKeys.authentication_firstNameHint.tr(),
              labelTextSecond: LocaleKeys.authentication_lastNameHint.tr(),
            ),
            verticalSpace(8),

            // phone
            CustomPhoneTextFormField(
              labelText: LocaleKeys.authentication_phoneNumber.tr(),
              countryCodeController: cubit.countryCodeController,
              phoneNumberController: cubit.phoneNumberController,
            ),
            // email & language
            FutureBuilder(
              future: isTechnical(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  // while loading, show a placeholder or spinner
                  return const SizedBox.shrink();
                }

                final isTechnical = snapshot.data ?? false;
                if (isTechnical) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(8),
                      CustomEmailTextFormField(
                        emailController: cubit.emailController,
                        labelText: LocaleKeys.authentication_email.tr(),
                      ),
                      verticalSpace(8),
                      CustomDropDownMenu(
                        initialValue: cubit.languagesController.text,
                        hint: LocaleKeys.authentication_speakingLanguage.tr(),
                        items: ['category1', 'category2', 'category3'],
                        onChanged: (value) {
                          setState(() {
                            cubit.languagesController.text = value!;
                          });
                        },
                      ),
                      verticalSpace(24),
                    ],
                  );
                } else {
                  return verticalSpace(24);
                }
              },
            ),

            // social media
            EditProfileSocialMedia(),

            // change password
            EditProfileAdditional(
              onTap: () {
                context.pushNamed(AppRoutes.clientChangePasswordScreen);
              },
              icon: AppImages.lockIcon,
              title: LocaleKeys.profile_changePassword.tr(),
            ),
            verticalSpace(24),

            // delete account
            GestureDetector(
              onTap: () {
                openBottomSheet(
                  context: context,
                  bottomSheetContent: DeleteAccountBottomSheet(),
                );
              },
              child: ProfileContentItem(
                icon: AppImages.deleteIcon,
                title: LocaleKeys.profile_deleteAccount.tr(),
                isDivider: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
