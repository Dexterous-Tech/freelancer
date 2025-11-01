import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/common/edit_profile/data/models/update_profile_model.dart';

import '../../../../../../core/di/injection_container.dart';
import '../../../../login/data/models/forget_password_model.dart';
import '../../../../widgets/resend_code/manager/resend_code_cubit.dart';
import '../../../../widgets/resend_code/widget/custom_resend_code.dart';

class VerificationResendCode extends StatelessWidget {
  const VerificationResendCode({
    super.key,
    this.forgetPasswordRequestBodyModel,
    this.verificationUpdateProfile,
  });

  final ForgetPasswordRequestBodyModel? forgetPasswordRequestBodyModel;
  final VerificationUpdateProfile? verificationUpdateProfile;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ResendCodeCubit>(),
      child: CustomResendCode(
        countryCode:
            forgetPasswordRequestBodyModel?.countryCode ??
            verificationUpdateProfile?.oldCountryCode ??
            '',
        phone:
            forgetPasswordRequestBodyModel?.phone ??
            verificationUpdateProfile?.oldPhoneNumber ??
            '',
        newPhone: verificationUpdateProfile?.phoneNumber ?? '',
        newCountryCode: verificationUpdateProfile?.countryCode ?? '',
      ),
    );
  }
}
