import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/features/auth/forget_password/presentation/view/widgets/forget_password_form.dart';
import 'package:freelancer/features/auth/forget_password/presentation/view/widgets/forget_password_resend_code.dart';
import 'package:freelancer/features/auth/login/data/models/forget_password_model.dart';
import 'package:freelancer/features/auth/widgets/auth_body.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key, required this.phoneNumber});
  final ForgetPasswordRequestBodyModel phoneNumber;

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  @override
  Widget build(BuildContext context) {
    // // Ensure country code format is +XXX (not XXX+)
    String countryCode = widget.phoneNumber.countryCode.trim();
    // Remove any + signs and add one at the start
    countryCode = '+${countryCode.replaceAll('+', '')}';
    String phone = widget.phoneNumber.phone.trim();
    String phoneNumber = '$countryCode $phone';
    return SingleChildScrollView(
      child: AuthBody(
        title: LocaleKeys.authentication_forgetPasswordTitle.tr(),
        subTitle: LocaleKeys.authentication_enterDigits.tr(),
        additionalText: phoneNumber,
        authBodyContent: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ForgetPasswordForm(
              forgetPasswordRequestBodyModel: widget.phoneNumber,
            ),
            ForgetPasswordResendCode(
              forgetPasswordRequestBodyModel: widget.phoneNumber,
            ),
          ],
        ),
      ),
    );
  }
}
