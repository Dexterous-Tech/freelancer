import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:freelancer/core/networking/api_services.dart';
import 'package:freelancer/features/auth/data/models/auth_action_response_model.dart';
import 'package:freelancer/features/auth/new_password_screen/data/models/new_password_model.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_error_model.dart';

class NewPasswordRepo {
  final ApiServices _apiServices;

  NewPasswordRepo(this._apiServices);

  Future<Either<ApiErrorModel, AuthActionResponseModel>> resetPassword(
    NewPasswordRequestBodyModel body,
  ) async {
    try {
      final response = await _apiServices.resetPassword(body);

      return Right(response);
    } catch (e) {
      log("error in resetPassword $e");
      if (e is ApiErrorModel) {
        return Left(e);
      }
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
