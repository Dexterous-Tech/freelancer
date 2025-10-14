import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/features/auth/widgets/auth_body.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../manager/verification_cubit.dart';
import 'verification_form.dart';
import 'verification_resend_code.dart';

class VerificationBody extends StatefulWidget {
  const VerificationBody({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<VerificationBody> createState() => _VerificationBodyState();
}

class _VerificationBodyState extends State<VerificationBody> {
  @override
  void initState() {
    super.initState();
    VerificationCubit.get(context).startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AuthBody(
        title: LocaleKeys.authentication_verifyAccountTitle.tr(),
        subTitle: LocaleKeys.authentication_enterDigits.tr(),
        additionalText: widget.phoneNumber,
        authBodyContent: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [VerificationForm(), VerificationResendCode()],
        ),
      ),
    );
  }
}
