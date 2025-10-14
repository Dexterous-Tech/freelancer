import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/widgets/forms/custom_country_code_picker.dart';
import 'package:freelancer/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/spacing.dart';
import '../../../../../../core/widgets/forms/custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  ValueNotifier<String> countryCode = ValueNotifier<String>('');
  String? phoneErrorMessage;
  @override
  void initState() {
    super.initState();
    final cubit = LoginCubit.get(context);
    countryCode.addListener(() {
      cubit.countryCodeController.text = countryCode.value;
    });
  }

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.get(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: cubit.phoneFormKey,
                child: SizedBox(
                  height: 60.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCountryCodePicker(code: countryCode),
                      horizontalSpace(8),
                      Expanded(
                        child: CustomTextFormField(
                          controller: cubit.phoneNumberController,
                          keyboardType: TextInputType.phone,
                          hintText: LocaleKeys.authentication_phoneNumber.tr(),
                          inputFormatters: [
                            FilteringTextInputFormatter
                                .digitsOnly, // ✅ Only numbers
                          ],
                          errorText: null, // removes default error
                          errorStyle: const TextStyle(height: 0),
                          borderColor: phoneErrorMessage != null
                              ? AppColors.red
                              : AppColors
                                    .darkBlue, // Change border color based on error
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              setState(() {
                                phoneErrorMessage = LocaleKeys
                                    .authentication_fieldRequired
                                    .tr();
                              });
                              return null;
                            }
                            // ✅ No error
                            setState(() {
                              phoneErrorMessage = null;
                            });
                            return null;
                          }, // Empty validator to prevent height changes
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Show error message below the row
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: phoneErrorMessage != null
                    ? Padding(
                        key: const ValueKey('errorText'),
                        padding: EdgeInsets.only(top: 6.h, right: 4.w),
                        child: Text(
                          phoneErrorMessage!,
                          style: TextStyle(
                            color: AppColors.red,
                            fontSize: 12.sp,
                          ),
                        ),
                      )
                    : const SizedBox(key: ValueKey('noError')),
              ),
            ],
          ),
          verticalSpace(8),
          Listener(
            onPointerDown: (_) {
              // Disable drag start
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: CustomTextFormField(
              controller: cubit.passwordController,
              hintText: LocaleKeys.authentication_password.tr(),
              obscureText: obscureText,
              enableInteractiveSelection:
                  false, // 🚫 disable copy, cut, paste, drag, drop
              contextMenuBuilder: (context, editableTextState) {
                return const SizedBox(); // disables long-press menu
              },
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: SvgPicture.asset(
                  obscureText
                      ? AppImages.visibleEyeIcon
                      : AppImages.invisibleEyeIcon,
                  width: 22.w,
                  height: 22.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return LocaleKeys.authentication_fieldRequired.tr();
                }
                if (value.length < 8) {
                  return LocaleKeys.authentication_passwordValidation.tr();
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
