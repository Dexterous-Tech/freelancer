import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:freelancer/core/networking/api_error_handler.dart';
import 'package:freelancer/core/networking/api_error_model.dart';
import 'package:freelancer/core/networking/api_services.dart';
import 'package:freelancer/features/auth/data/models/auth_action_response_model.dart';

import '../models/profile_models.dart';

class ProfileRepo {
  final ApiServices _apiServices;

  ProfileRepo(this._apiServices);

  Future<Either<ApiErrorModel, AuthActionResponseModel>> logout() async {
    try {
      final response = await _apiServices.logout();
      return Right(response);
    } catch (e) {
      log("error in logout $e");
      if (e is ApiErrorModel) {
        return Left(e);
      }
      return Left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, ProfileResponseModel>> getProfile() async {
    try {
      final response = await _apiServices.getProfile();
      return Right(response);
    } catch (e) {
      log("error in get profile $e");
      if (e is ApiErrorModel) {
        return Left(e);
      }
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
