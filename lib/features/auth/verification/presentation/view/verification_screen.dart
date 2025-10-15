import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/verification_cubit.dart';
import 'widgets/verification_body.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: Scaffold(body: VerificationBody(phoneNumber: phoneNumber)),
    );
  }
}
