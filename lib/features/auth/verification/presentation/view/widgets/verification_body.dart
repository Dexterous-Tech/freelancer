import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/features/auth/widgets/auth_body.dart';
import 'package:freelancer/generated/locale_keys.g.dart';
import '../../../../login/data/models/forget_password_model.dart';
import 'verification_form.dart';
import 'verification_resend_code.dart';

class VerificationBody extends StatelessWidget {
  const VerificationBody({super.key, required this.phoneNumberModel});
  final ForgetPasswordRequestBodyModel phoneNumberModel;

  @override
  Widget build(BuildContext context) {
    // // Ensure country code format is +XXX (not XXX+)
    String countryCode = phoneNumberModel.countryCode.trim();
    // Remove any + signs and add one at the start
    countryCode = '+${countryCode.replaceAll('+', '')}';
    String phone = phoneNumberModel.phone.trim();
    String phoneNumber = '$countryCode $phone';
    return SingleChildScrollView(
      child: AuthBody(
        title: LocaleKeys.authentication_verifyAccountTitle.tr(),
        subTitle: LocaleKeys.authentication_enterDigits.tr(),
        additionalText: phoneNumber,
        authBodyContent: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerificationForm(forgetPasswordRequestBodyModel: phoneNumberModel),
            VerificationResendCode(
              forgetPasswordRequestBodyModel: phoneNumberModel,
            ),
          ],
        ),
      ),
    );
  }
}
