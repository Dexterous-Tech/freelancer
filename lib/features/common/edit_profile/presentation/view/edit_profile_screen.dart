import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../common/profile/data/models/profile_models.dart';
import '../manager/edit_profile_cubit.dart';
import 'widgets/edit_profile_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.profileDataModel});
  final ProfileDataModel profileDataModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<EditProfileCubit>(),
      child: Scaffold(
        body: EditProfileBody(profileDataModel: profileDataModel),
      ),
    );
  }
}
