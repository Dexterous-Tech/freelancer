import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:freelancer/core/networking/api_error_handler.dart';
import 'package:freelancer/core/networking/api_error_model.dart';
import 'package:freelancer/core/networking/api_services.dart';
import 'package:freelancer/features/auth/login/data/models/forget_password_model.dart';
import 'package:freelancer/features/auth/login/data/models/login_models.dart';

import '../../../data/models/auth_action_response_model.dart';

class LoginRepo {
  final ApiServices _apiServices;

  LoginRepo(this._apiServices);

  Future<Either<ApiErrorModel, LoginResponseModel>> login(
    LoginRequestBodyModel body,
  ) async {
    try {
      final response = await _apiServices.login(body);

      return Right(response);
    } catch (e) {
      log("error in login $e");
      if (e is ApiErrorModel) {
        return Left(e);
      }
      return Left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, AuthActionResponseModel>> forgetPassword(
    ForgetPasswordRequestBodyModel body,
  ) async {
    try {
      final response = await _apiServices.forgetPassword(body);

      return Right(response);
    } catch (e) {
      log("error in forgetPassword $e");
      if (e is ApiErrorModel) {
        return Left(e);
      }
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
