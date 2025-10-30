import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/forms/custom_text_form_field.dart';
import 'package:freelancer/features/auth/widgets/custom_email_text_form_field.dart';
import 'package:freelancer/features/auth/widgets/custom_name_text_form_field.dart';
import 'package:freelancer/features/auth/widgets/custom_phone_text_form_field.dart';
import 'package:freelancer/features/common/request_speciality/presentation/manager/request_speciality_cubit.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class RequestSpecialityForm extends StatelessWidget {
  const RequestSpecialityForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RequestSpecialityCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNameTextFormField(
              hint: LocaleKeys.authentication_name.tr(),
              labelText: LocaleKeys.authentication_name.tr(),
              nameController: cubit.nameController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(
                    r"[a-zA-Z0-9\u0600-\u06FF!@#$%^&*(),.?/:{}|<>_\-+=\[\]\\;'\s]",
                  ),
                ),
              ],
              validator: (value) {
                final text = value?.trim() ?? '';

                if (text.isEmpty) {
                  return LocaleKeys.authentication_fieldRequired.tr();
                }
                if (text.length < 4) {
                  return LocaleKeys.authentication_nameValidation.tr();
                }
                if (text.length > 100) {
                  return LocaleKeys.authentication_nameMaxValidation.tr();
                }
                return null;
              },
              errorStyle: TextStyle(fontSize: 12.sp, color: Colors.red),
            ),

            verticalSpace(8),
            CustomEmailTextFormField(
              emailController: cubit.emailController,
              labelText: LocaleKeys.authentication_email.tr(),
            ),
            verticalSpace(8),
            CustomPhoneTextFormField(
              countryCodeController: cubit.countryCodeController,
              phoneNumberController: cubit.phoneController,
              labelText: LocaleKeys.authentication_phoneNumber.tr(),
            ),
            verticalSpace(8),
            CustomTextFormField(
              hintText: LocaleKeys.authentication_enterYourMessage.tr(),
              controller: cubit.messageController,
              maxLines: 3,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(
                    r"[a-zA-Z0-9\u0600-\u06FF!@#$%^&*(),.?:{}|<>_\-+=\[\]\\;'/\s]",
                  ),
                ),
              ],
              validator: (value) {
                final text = value?.trim() ?? '';

                if (text.isEmpty) {
                  return LocaleKeys.authentication_fieldRequired.tr();
                }
                if (text.length < 4) {
                  return LocaleKeys.authentication_nameValidation.tr();
                }
                if (text.length > 500) {
                  return LocaleKeys.authentication_nameMaxValidation.tr();
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
