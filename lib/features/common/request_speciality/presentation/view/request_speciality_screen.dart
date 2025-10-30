import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/request_speciality_body.dart';

import '../../../../../core/di/injection_container.dart';
import '../manager/request_speciality_cubit.dart';

class RequestSpecialityScreen extends StatelessWidget {
  const RequestSpecialityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RequestSpecialityCubit>(),
      child: Scaffold(body: RequestSpecialityBody()),
    );
  }
}
