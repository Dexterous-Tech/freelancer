import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/core/shared/shared_preferences_helper.dart';
import 'package:freelancer/core/shared/shared_preferences_key.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/bottom_sheet/error_bottom_sheet.dart';
import '../../../../../../core/widgets/bottom_sheet/open_bottom_sheet.dart';
import '../../../data/models/forget_password_model.dart';
import '../../manager/login_cubit.dart';
import 'login_button.dart';
import '../../../../widgets/auth_question.dart';
import 'login_forget_password.dart';
import 'login_form.dart';
import '../../../../widgets/auth_body.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (context, state) =>
          state is LoginLoading ||
          state is LoginFailure ||
          state is LoginSuccess,
      listener: (context, state) async {
        if (state is LoginFailure) {
          if (state.error.data?['phone_is_verified'] == false) {
            final cubit = LoginCubit.get(context);
            openBottomSheet(
              context: context,
              bottomSheetContent: ErrorBottomSheet(
                error: state.error.displayMessage,
                onPressed: () {
                  context.pushReplacementNamed(
                    AppRoutes.verificationScreen,
                    arguments: ForgetPasswordRequestBodyModel(
                      countryCode: cubit.countryCodeController.text,
                      phone: cubit.phoneNumberController.text,
                    ),
                  );
                },
                textButton: LocaleKeys.authentication_verifyAccountTitle.tr(),
              ),
            );
          } else {
            openBottomSheet(
              context: context,
              bottomSheetContent: ErrorBottomSheet(
                error: state.error.displayMessage,
              ),
            );
          }
        }
        if (state is LoginSuccess) {
          final route = await SharedPreferencesHelper.getString(
            SharedPreferencesKey.routeAfterLogin,
          );
          if (route == AppRoutes.mainHomeScreen && context.mounted) {
            await context.pushReplacementNamed(route ?? '', arguments: 1);
            await SharedPreferencesHelper.remove(
              SharedPreferencesKey.routeAfterLogin,
            );
          }
          if (route == AppRoutes.serviceProviderDetailsScreen) {
            final serviceId = await SharedPreferencesHelper.getSecuredString(
              SharedPreferencesKey.serviceProviderId,
            );
            final id = int.parse(serviceId);
            if (context.mounted) {
              await context.pushReplacementNamed(route ?? '', arguments: id);
            }
            await SharedPreferencesHelper.remove(
              SharedPreferencesKey.routeAfterLogin,
            );
          }
        }
      },
      child: SingleChildScrollView(
        child: AuthBody(
          isBack: false,
          title: LocaleKeys.authentication_loginTitle.tr(),
          subTitle: LocaleKeys.authentication_welcomeBack.tr(),
          authBodyContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginForm(),
              verticalSpace(8),
              LoginForgetPassword(),
              verticalSpace(16),
              LoginButton(),
              verticalSpace(16),
              AuthQuestion(
                title: LocaleKeys.authentication_notHaveAccount.tr(),
                subtitle: LocaleKeys.authentication_createNewAccount.tr(),
                onTap: () {
                  context.pushNamed(AppRoutes.signupScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
