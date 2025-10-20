import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../manager/about_us_cubit.dart';
import ''
    'widgets/about_us_body.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AboutUsCubit>(),
      child: Scaffold(body: AboutUsBody()),
    );
  }
}
