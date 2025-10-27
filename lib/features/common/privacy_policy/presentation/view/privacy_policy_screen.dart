import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/injection_container.dart';
import '../manager/privacy_policy_cubit.dart';
import 'widgets/privacy_policy_body.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PrivacyPolicyCubit>(),
      child: Scaffold(body: PrivacyPolicyBody()),
    );
  }
}
