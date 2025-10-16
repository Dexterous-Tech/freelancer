import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/client_edit_profile_cubit.dart';
import 'widgets/client_edit_profile_body.dart';

class ClientEditProfileScreen extends StatelessWidget {
  const ClientEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientEditProfileCubit(),
      child: Scaffold(body: ClientEditProfileBody()),
    );
  }
}
