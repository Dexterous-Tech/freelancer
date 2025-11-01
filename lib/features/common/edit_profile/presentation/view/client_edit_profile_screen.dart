import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../common/profile/data/models/profile_models.dart';
import '../manager/client_edit_profile_cubit.dart';
import 'widgets/client_edit_profile_body.dart';

class ClientEditProfileScreen extends StatelessWidget {
  const ClientEditProfileScreen({super.key, required this.profileDataModel});
  final ProfileDataModel profileDataModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ClientEditProfileCubit>(),
      child: Scaffold(
        body: ClientEditProfileBody(profileDataModel: profileDataModel),
      ),
    );
  }
}
