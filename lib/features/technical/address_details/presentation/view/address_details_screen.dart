import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/address_details_cubit.dart';
import '../../../../../core/di/injection_container.dart';
import 'widgets/address_details_body.dart';

class AddressDetailsScreen extends StatelessWidget {
  const AddressDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddressDetailsCubit>(),
      child: Scaffold(body: AddressDetailsBody()),
    );
  }
}
