import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'package:freelancer/features/technical/address_details/presentation/view/widgets/address_details_form.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class AddressDetailsBody extends StatelessWidget {
  const AddressDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(title: LocaleKeys.profile_addressDetails.tr()),
        verticalSpace(24),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(child: AddressDetailsForm()),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
