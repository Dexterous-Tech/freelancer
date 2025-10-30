import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_bottom_button.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'package:freelancer/features/common/contact_us/presentation/view/widgets/contact_us_form.dart';
import 'package:freelancer/features/common/contact_us/presentation/view/widgets/contact_us_social_media.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../manager/contact_us_cubit.dart';

class ContactUsBody extends StatelessWidget {
  const ContactUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = ContactUsCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(title: LocaleKeys.more_contactus.tr()),
        verticalSpace(24),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContactUsForm(),
                        Expanded(child: verticalSpace(50)),
                        ContactUsSocialMedia(),
                        verticalSpace(24),
                        CustomBottomButton(
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {}
                          },
                          textButton: LocaleKeys.send.tr(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
