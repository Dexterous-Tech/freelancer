import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:freelancer/core/networking/api_error_handler.dart';
import 'package:freelancer/core/networking/api_error_model.dart';
import 'package:freelancer/core/networking/api_services.dart';

import '../../../../auth/data/models/auth_action_response_model.dart';
import '../models/change_password_model.dart';

class ChangePasswordRepo {
  final ApiServices _apiServices;

  ChangePasswordRepo(this._apiServices);

  Future<Either<ApiErrorModel, AuthActionResponseModel>> changePassword(
    ChangePasswordRequestBodyModel body,
  ) async {
    try {
      final response = await _apiServices.changePassword(body);

      return Right(response);
    } catch (e) {
      log("error in change password");
      if (e is ApiErrorModel) {
        return Left(e);
      }
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
