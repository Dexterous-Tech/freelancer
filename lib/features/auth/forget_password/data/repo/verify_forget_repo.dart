import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:freelancer/core/networking/api_services.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_error_model.dart';
import '../../../data/models/auth_action_response_model.dart';
import '../models/verify_forget_model.dart';

class VerifyForgetRepo {
  final ApiServices _apiServices;

  VerifyForgetRepo(this._apiServices);

  Future<Either<ApiErrorModel, AuthActionResponseModel>> verifyForget(
    VerifyForgetRequestBodModel body,
  ) async {
    try {
      final response = await _apiServices.verifyForget(body, '1');

      return Right(response);
    } catch (e) {
      log("error in verifyForget $e");
      if (e is ApiErrorModel) {
        return Left(e);
      }
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
