import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/bottom_sheet/open_bottom_sheet.dart';
import 'package:freelancer/features/common/edit_profile/presentation/view/widgets/bottom_sheet/social_media_bottom_sheet.dart';
import 'package:freelancer/features/common/edit_profile/presentation/view/widgets/edit_profile_additional.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/shared/shared_preferences_helper.dart';
import '../../../../../../core/shared/shared_preferences_key.dart';

class EditProfileSocialMedia extends StatelessWidget {
  const EditProfileSocialMedia({super.key});

  Future<bool> isTechnical() async {
    final isTechnical = await SharedPreferencesHelper.getBool(
      SharedPreferencesKey.isTechnical,
    );

    return isTechnical ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isTechnical(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // while loading, show a placeholder or spinner
          return const SizedBox.shrink();
        }

        final isTechnical = snapshot.data ?? false;
        if (isTechnical) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditProfileAdditional(
                icon: AppImages.addIcon,
                title: LocaleKeys.profile_addSocialMedia.tr(),
                onTap: () {
                  openBottomSheet(
                    context: context,
                    bottomSheetContent: SocialMediaBottomSheet(),
                  );
                },
              ),
              verticalSpace(16),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
