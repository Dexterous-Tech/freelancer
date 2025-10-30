import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsSocialMedia extends StatelessWidget {
  const ContactUsSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customSocialMediaIcon(
            assetName: AppImages.linkedInIcon,
            onTap: () =>
                _launchURL('https://www.linkedin.com/company/yourcompany'),
          ),
          customSocialMediaIcon(
            assetName: AppImages.twitterIcon,
            onTap: () => _launchURL('https://twitter.com/yourcompany'),
          ),
          customSocialMediaIcon(
            assetName: AppImages.whatsappIcon,
            onTap: () => _launchURL('https://wa.me/966500000000'),
          ),
          customSocialMediaIcon(
            assetName: AppImages.telegramIcon,
            onTap: () => _launchURL('https://t.me/yourtelegram'),
          ),
        ],
      ),
    );
  }

  Widget customSocialMediaIcon({
    required String assetName,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100).r,
        child: SvgPicture.asset(assetName, width: 40.w, height: 40.h),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
