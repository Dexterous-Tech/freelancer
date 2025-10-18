import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_error_model.dart';
import '../../../../../core/networking/api_services.dart';
import '../../../data/models/auth_action_response_model.dart';
import '../../../data/models/verify_model.dart';

class VerificationRepo {
  final ApiServices _apiServices;

  VerificationRepo(this._apiServices);

  Future<Either<ApiErrorModel, AuthActionResponseModel>> verifyForget(
    VerifyRequestBodModel body,
  ) async {
    try {
      final response = await _apiServices.verifyRegister(body);

      return Right(response);
    } catch (e) {
      log("error in verification $e");
      if (e is ApiErrorModel) {
        return Left(e);
      }
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
