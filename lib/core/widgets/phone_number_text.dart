import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class PhoneNumberText extends StatelessWidget {
  const PhoneNumberText({super.key});

  @override
  Widget build(BuildContext context) {
    String countryCode = '+966';
    // Remove any + signs and add one at the start
    countryCode = '+${countryCode.replaceAll('+', '')}';
    String phone = '50 123 4567';
    String phoneNumber = '$countryCode $phone';
    return Text(
      phoneNumber,
      style: AppTextStyles.font14BlackRegular.copyWith(
        color: AppColors.sonicSilver,
      ),
      textDirection: TextDirection.ltr,
    );
  }
}
