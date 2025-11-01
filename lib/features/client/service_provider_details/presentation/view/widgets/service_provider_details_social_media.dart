import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/gradiant_icon_border.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import 'package:url_launcher/url_launcher.dart';

class ServiceProviderDetailsSocialMedia extends StatelessWidget {
  const ServiceProviderDetailsSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.services_socialMedia.tr(),
          style: AppTextStyles.font12OuterSpaceSemiBold.copyWith(
            color: AppColors.jet,
          ),
        ),
        verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => _launchURL('https://twitter.com/yourpage'),
              child: GradiantIconBorder(
                assetName: AppImages.twitterUnIcon,
                iconSize: 25,
              ),
            ),
            GestureDetector(
              onTap: () => _launchURL('https://www.tiktok.com/@yourusername'),
              child: GradiantIconBorder(
                assetName: AppImages.tiktokUnIcon,
                iconSize: 25,
              ),
            ),
            GestureDetector(
              onTap: () => _launchURL('https://www.facebook.com/yourpage'),
              child: GradiantIconBorder(
                assetName: AppImages.facebookUnIcon,
                iconSize: 25,
              ),
            ),
            GestureDetector(
              onTap: () => _launchURL('https://www.instagram.com/yourusername'),
              child: GradiantIconBorder(
                assetName: AppImages.instagramUnIcon,
                iconSize: 25,
              ),
            ),
            GestureDetector(
              onTap: () =>
                  _launchURL('https://www.snapchat.com/add/yourusername'),
              child: GradiantIconBorder(
                assetName: AppImages.snapchatUnIcon,
                iconSize: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
