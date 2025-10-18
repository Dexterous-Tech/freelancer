import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection_container.dart';
import '../../../login/data/models/forget_password_model.dart';
import '../manager/verification_cubit.dart';
import 'widgets/verification_body.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key, required this.phoneNumberModel});

  final ForgetPasswordRequestBodyModel phoneNumberModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VerificationCubit>(),
      child: Scaffold(
        body: VerificationBody(phoneNumberModel: phoneNumberModel),
      ),
    );
  }
}
