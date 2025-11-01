import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/folders_cubit.dart';
import '../../../../../core/di/injection_container.dart';
import 'widgets/folders_body.dart';

class FoldersScreen extends StatelessWidget {
  const FoldersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FoldersCubit>(),
      child: Scaffold(body: FoldersBody()),
    );
  }
}
