import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/common/edit_profile/data/models/update_profile_model.dart';

import '../../../../../core/di/injection_container.dart';
import '../../../login/data/models/forget_password_model.dart';
import '../manager/verification_cubit.dart';
import 'widgets/verification_body.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({
    super.key,
    this.phoneNumberModel,
    this.verificationUpdateProfile,
  });

  final ForgetPasswordRequestBodyModel? phoneNumberModel;
  final VerificationUpdateProfile? verificationUpdateProfile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VerificationCubit>(),
      child: Scaffold(
        body: VerificationBody(
          phoneNumberModel: phoneNumberModel,
          verificationUpdateProfile: verificationUpdateProfile,
        ),
      ),
    );
  }
}
