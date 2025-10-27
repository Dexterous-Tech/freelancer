import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:freelancer/core/networking/api_error_handler.dart';
import 'package:freelancer/core/networking/api_error_model.dart';
import 'package:freelancer/core/networking/api_services.dart';
import 'package:freelancer/features/auth/data/models/auth_action_response_model.dart';
import 'package:freelancer/features/auth/signup/data/models/signup_models.dart';

class SignupRepo {
  final ApiServices _apiServices;

  SignupRepo(this._apiServices);

  Future<Either<ApiErrorModel, AuthActionResponseModel>> register(
    SignupRequestBodyModel body,
  ) async {
    try {
      final response = await _apiServices.register(body);

      return Right(response);
    } catch (e) {
      log("error in register $e");
      if (e is ApiErrorModel) {
        return Left(e);
      }
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
