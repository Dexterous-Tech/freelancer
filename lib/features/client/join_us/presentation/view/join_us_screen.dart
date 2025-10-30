import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/client/join_us/presentation/manager/join_us_cubit.dart';
import '../../../../../core/di/injection_container.dart';
import 'widgets/join_us_body.dart';

class JoinUsScreen extends StatelessWidget {
  const JoinUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<JoinUsCubit>(),
      child: Scaffold(body: JoinUsBody()),
    );
  }
}
