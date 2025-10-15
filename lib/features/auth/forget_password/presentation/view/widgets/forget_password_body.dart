import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/features/auth/forget_password/presentation/view/widgets/forget_password_form.dart';
import 'package:freelancer/features/auth/forget_password/presentation/view/widgets/forget_password_resend_code.dart';
import 'package:freelancer/features/auth/widgets/auth_body.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../manager/forget_password_cubit.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  @override
  void initState() {
    super.initState();
    ForgetPasswordCubit.get(context).startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AuthBody(
        title: LocaleKeys.authentication_forgetPasswordTitle.tr(),
        subTitle: LocaleKeys.authentication_enterDigits.tr(),
        additionalText: widget.phoneNumber,
        authBodyContent: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ForgetPasswordForm(), ForgetPasswordResendCode()],
        ),
      ),
    );
  }
}
