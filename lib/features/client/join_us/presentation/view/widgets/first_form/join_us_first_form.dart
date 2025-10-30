import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/auth/widgets/custom_email_text_form_field.dart';
import 'package:freelancer/features/auth/widgets/custom_first_last_name_text_form_field.dart';
import 'package:freelancer/features/auth/widgets/custom_phone_text_form_field.dart';
import 'package:freelancer/features/client/join_us/presentation/view/widgets/first_form/join_us_first_form_upload_photo.dart';
import '../../../manager/join_us_cubit.dart';
import 'join_us_first_form_gender.dart';

class JoinUsFirstForm extends StatefulWidget {
  const JoinUsFirstForm({super.key});

  @override
  State<JoinUsFirstForm> createState() => _JoinUsFirstFormState();
}

class _JoinUsFirstFormState extends State<JoinUsFirstForm> {
  @override
  void initState() {
    super.initState();
    final cubit = JoinUsCubit.get(context);
    cubit.countryCodeNameController.text = '+966';
  }

  @override
  Widget build(BuildContext context) {
    final cubit = JoinUsCubit.get(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: cubit.firstFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFirstLastNameTextFormField(
              firstNameController: cubit.firstNameController,
              secondNameController: cubit.lastNameController,
            ),
            verticalSpace(8),
            CustomEmailTextFormField(
              emailController: cubit.emailNameController,
            ),
            verticalSpace(8),
            CustomPhoneTextFormField(
              countryCodeController: cubit.countryCodeNameController,
              phoneNumberController: cubit.phoneNameController,
            ),
            verticalSpace(8),
            JoinUsFirstFormGender(genderController: cubit.genderNameController),
            verticalSpace(8),
            JoinUsFirstFormUploadPhoto(),
          ],
        ),
      ),
    );
  }
}
