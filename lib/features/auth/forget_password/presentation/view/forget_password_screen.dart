import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/auth/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:freelancer/features/auth/forget_password/presentation/view/widgets/forget_password_body.dart';
import 'package:freelancer/features/auth/login/data/models/forget_password_model.dart';

import '../../../../../core/di/injection_container.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key, required this.phoneNumber});

  final ForgetPasswordRequestBodyModel phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ForgetPasswordCubit>(),
      child: Scaffold(body: ForgetPasswordBody(phoneNumberModel: phoneNumber)),
    );
  }
}
