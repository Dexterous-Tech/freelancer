import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/shared/shared_preferences_key.dart';
import 'package:freelancer/features/auth/login/data/models/forget_password_model.dart';
import 'package:freelancer/features/auth/login/data/repo/login_repo.dart';

import '../../../../../core/networking/dio_factory.dart';
import '../../../../../core/shared/shared_preferences_helper.dart';
import '../../../data/models/auth_action_response_model.dart';
import '../../data/models/login_models.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final LoginRepo loginRepo;

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();

  void login() async {
    emit(LoginLoading());
    var response = await loginRepo.login(
      LoginRequestBodyModel(
        countryCode: countryCodeController.text,
        phone: phoneNumberController.text,
        password: passwordController.text,
      ),
    );

    response.fold(
      (error) {
        emit(LoginFailure(error.displayMessage));
      },
      (loginResponseModel) async {
        // Check if user is blocked

        await saveUserToken(loginResponseModel.data!.token);
        log("save token ");

        // if (loginResponseModel.data?.redirectToAttribute != true) {
        //   // After successful login, save FCM token silently
        //   await saveFcmTokenSilently();
        //   // Mark user as logged in when redirectToAttribute is null, false, or any other value except true
        //   await SharedPreferencesHelper.setIsLoggedIn(true);
        // }

        emit(LoginSuccess(loginResponseModel));
      },
    );
  }

  void forgetPassword() async {
    emit(ForgetPasswordLoading());
    var response = await loginRepo.forgetPassword(
      ForgetPasswordRequestBodyModel(
        countryCode: countryCodeController.text,
        phone: phoneNumberController.text,
      ),
    );

    response.fold(
      (error) {
        emit(ForgetPasswordFailure(error.displayMessage));
      },
      (forgetResponseModel) async {
        emit(ForgetPasswordSuccess(forgetResponseModel));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    // Clear all shared preferences data before storing new token
    await SharedPreferencesHelper.deleteSecuredString(
      SharedPreferencesKey.apiTokenKey,
    );

    // Store the new token
    await SharedPreferencesHelper.setSecuredString(
      SharedPreferencesKey.apiTokenKey,
      token,
    );
    await DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
