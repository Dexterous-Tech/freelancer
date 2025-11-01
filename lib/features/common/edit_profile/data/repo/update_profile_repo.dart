import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:freelancer/core/networking/api_error_handler.dart';
import 'package:freelancer/core/networking/api_error_model.dart';
import 'package:freelancer/core/networking/api_services.dart';

import '../../../../auth/data/models/auth_action_response_model.dart';
import '../../../../common/profile/data/models/profile_models.dart';
import '../models/update_profile_model.dart';

class UpdateProfileRepo {
  final ApiServices _apiServices;

  UpdateProfileRepo(this._apiServices);

  Future<Either<ApiErrorModel, ProfileResponseModel>> updateProfile(
    UpdateProfileRequestBodyModel body,
  ) async {
    try {
      final response = await _apiServices.updateProfile(body);

      return Right(response);
    } catch (e) {
      log("error in update profile $e");
      if (e is ApiErrorModel) {
        return Left(e);
      }
      return Left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, AuthActionResponseModel>> deleteAccount(
    DeleteAccountBodyModel body,
  ) async {
    try {
      final response = await _apiServices.deleteAccount(body);
      return Right(response);
    } catch (e) {
      log("error in delete account $e");
      if (e is ApiErrorModel) {
        return Left(e);
      }
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
