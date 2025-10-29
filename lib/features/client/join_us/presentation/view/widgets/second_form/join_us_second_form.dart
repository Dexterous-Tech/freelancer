import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/forms/custom_drop_down_menu.dart';
import 'package:freelancer/core/widgets/forms/custom_text_form_field.dart';
import 'package:freelancer/generated/locale_keys.g.dart';
import '../../../manager/join_us_cubit.dart';

class JoinUsSecondForm extends StatefulWidget {
  const JoinUsSecondForm({super.key});

  @override
  State<JoinUsSecondForm> createState() => _JoinUsSecondFormState();
}

class _JoinUsSecondFormState extends State<JoinUsSecondForm> {
  @override
  Widget build(BuildContext context) {
    final cubit = JoinUsCubit.get(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: cubit.secondFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDownMenu(
              initialValue: cubit.professionalServiceController.text,
              hint: LocaleKeys.authentication_selectProfessionalCategory.tr(),
              items: ['category1', 'category2', 'category3'],
              onChanged: (value) {
                setState(() {
                  cubit.professionalServiceController.text = value!;
                });
              },
            ),
            verticalSpace(8),
            CustomDropDownMenu(
              initialValue: cubit.professionalController.text,
              hint: LocaleKeys.authentication_selectProfession.tr(),
              items: ['category1', 'category2', 'category3'],
              onChanged: (value) {
                setState(() {
                  cubit.professionalController.text = value!;
                });
              },
            ),
            verticalSpace(8),
            CustomDropDownMenu(
              initialValue: cubit.countryController.text,
              hint: LocaleKeys.authentication_selectCountryService.tr(),
              items: ['category1', 'category2', 'category3'],
              onChanged: (value) {
                setState(() {
                  cubit.countryController.text = value!;
                });
              },
            ),
            verticalSpace(8),
            CustomDropDownMenu(
              initialValue: cubit.cityController.text,
              hint: LocaleKeys.authentication_selectCityService.tr(),
              items: ['category1', 'category2', 'category3'],
              onChanged: (value) {
                setState(() {
                  cubit.cityController.text = value!;
                });
              },
            ),
            verticalSpace(8),
            CustomDropDownMenu(
              initialValue: cubit.nationalityController.text,
              hint: LocaleKeys.authentication_nationality.tr(),
              items: ['category1', 'category2', 'category3'],
              onChanged: (value) {
                setState(() {
                  cubit.nationalityController.text = value!;
                });
              },
            ),
            verticalSpace(8),
            CustomDropDownMenu(
              initialValue: cubit.languagesController.text,
              hint: LocaleKeys.authentication_speakingLanguage.tr(),
              items: ['category1', 'category2', 'category3'],
              onChanged: (value) {
                setState(() {
                  cubit.languagesController.text = value!;
                });
              },
            ),
            verticalSpace(8),
            CustomTextFormField(
              controller: cubit.writtenController,
              hintText: LocaleKeys.authentication_writeService.tr(),
              validator: (value) {},
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
