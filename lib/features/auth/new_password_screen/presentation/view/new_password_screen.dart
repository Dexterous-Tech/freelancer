import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../login/data/models/forget_password_model.dart';
import '../manager/new_password_cubit.dart';
import 'widgets/new_password_body.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({
    super.key,
    required this.forgetPasswordRequestBodyModel,
  });
  final ForgetPasswordRequestBodyModel forgetPasswordRequestBodyModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewPasswordCubit>(),
      child: Scaffold(
        body: NewPasswordBody(
          forgetPasswordRequestBodyModel: forgetPasswordRequestBodyModel,
        ),
      ),
    );
  }
}
