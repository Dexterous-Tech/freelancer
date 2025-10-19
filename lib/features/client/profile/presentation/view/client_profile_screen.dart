import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/features/client/profile/presentation/manager/profile_cubit.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/widgets/custom_header.dart';
import '../../../../../generated/locale_keys.g.dart';
import 'widgets/profile_content.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileCubit>(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader(
                  title: LocaleKeys.bottomNavigationBar_profile.tr(),
                  isBack: false,
                ),
                ProfileContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
