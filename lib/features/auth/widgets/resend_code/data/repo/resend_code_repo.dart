import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:freelancer/core/networking/api_services.dart';

import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_error_model.dart';
import '../../../../data/models/auth_action_response_model.dart';
import '../../../../login/data/models/forget_password_model.dart';

class ResendCodeRepo {
  final ApiServices _apiServices;

  ResendCodeRepo(this._apiServices);
  Future<Either<ApiErrorModel, AuthActionResponseModel>> resendOtp(
    ForgetPasswordRequestBodyModel body,
  ) async {
    try {
      final response = await _apiServices.resendOtp(body);

      return Right(response);
    } catch (e) {
      log("error in resend otp $e");
      if (e is ApiErrorModel) {
        return Left(e);
      }
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
