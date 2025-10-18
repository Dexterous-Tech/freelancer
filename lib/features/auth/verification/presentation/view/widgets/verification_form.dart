import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import '../../../../widgets/custom_verification_text_form_field.dart';

import '../../manager/verification_cubit.dart';

class VerificationForm extends StatelessWidget {
  const VerificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = VerificationCubit.get(context);

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomVerificationTextFormField(
            codeController: cubit.codeController,
            onChange: () {},
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
