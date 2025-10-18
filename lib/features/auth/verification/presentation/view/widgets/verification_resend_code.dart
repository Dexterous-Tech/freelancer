import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/injection_container.dart';
import '../../../../login/data/models/forget_password_model.dart';
import '../../../../widgets/resend_code/manager/resend_code_cubit.dart';
import '../../../../widgets/resend_code/widget/custom_resend_code.dart';

class VerificationResendCode extends StatelessWidget {
  const VerificationResendCode({
    super.key,
    required this.forgetPasswordRequestBodyModel,
  });

  final ForgetPasswordRequestBodyModel forgetPasswordRequestBodyModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ResendCodeCubit>(),
      child: CustomResendCode(
        countryCode: forgetPasswordRequestBodyModel.countryCode,
        phone: forgetPasswordRequestBodyModel.phone,
      ),
    );
  }
}
