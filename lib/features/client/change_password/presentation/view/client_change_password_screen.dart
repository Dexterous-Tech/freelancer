import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/injection_container.dart';
import 'widgets/client_change_password_body.dart';
import '../manager/client_change_password_cubit.dart';

class ClientChangePasswordScreen extends StatelessWidget {
  const ClientChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ClientChangePasswordCubit>(),
      child: Scaffold(body: ClientChangePasswordBody()),
    );
  }
}
