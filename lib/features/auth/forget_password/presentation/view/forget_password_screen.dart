import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/auth/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:freelancer/features/auth/forget_password/presentation/view/widgets/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: Scaffold(body: ForgetPasswordBody(phoneNumber: phoneNumber)),
    );
  }
}
