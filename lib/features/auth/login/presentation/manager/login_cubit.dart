import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/networking/api_error_model.dart';
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
        emit(LoginFailure(error));
      },
      (loginResponseModel) async {
        await saveUserToken(loginResponseModel.data!.token);
        log("save token  ");
        await saveFcmTokenSilently();
        await SharedPreferencesHelper.setBool(
          SharedPreferencesKey.isLogging,
          true,
        );
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
        emit(ForgetPasswordFailure(error));
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

    final secureToken = await SharedPreferencesHelper.getSecuredString(
      SharedPreferencesKey.apiTokenKey,
    );
    await DioFactory.setTokenIntoHeaderAfterLogin(secureToken);
  }

  Future<void> saveFcmTokenSilently() async {
    try {
      await saveTokeFromFirebase();
      String token = await SharedPreferencesHelper.getSecuredString(
        SharedPreferencesKey.deviceToken,
      );
      var response = await loginRepo.updateFcmToken(
        UpdateFcmTokenRequestBodyModel(token: token),
      );

      response.fold(
        (error) {
          log("FCM token save failed: ${error.displayMessage}");
          // Don't emit error state to avoid showing error to user
        },
        (fcmResponseModel) async {
          log("FCM token saved successfully");
          // Don't emit success state to avoid showing success to user
        },
      );
    } catch (e) {
      log("Error saving FCM token: $e");
      // Don't emit error state to avoid showing error to user
    }
  }

  Future<void> saveTokeFromFirebase() async {
    await SharedPreferencesHelper.deleteSecuredString(
      SharedPreferencesKey.deviceToken,
    );
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    await SharedPreferencesHelper.setSecuredString(
      SharedPreferencesKey.deviceToken,
      token!,
    );
  }
}
