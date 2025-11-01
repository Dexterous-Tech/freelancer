import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'folders_form.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class FoldersBody extends StatelessWidget {
  const FoldersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(title: LocaleKeys.profile_folders.tr()),
        verticalSpace(24),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(child: FoldersForm()),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
