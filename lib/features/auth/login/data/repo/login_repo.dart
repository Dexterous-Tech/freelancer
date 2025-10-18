import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:freelancer/core/networking/api_error_handler.dart';
import 'package:freelancer/core/networking/api_error_model.dart';
import 'package:freelancer/core/networking/api_services.dart';
import 'package:freelancer/features/auth/login/data/models/login_models.dart';

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
}
