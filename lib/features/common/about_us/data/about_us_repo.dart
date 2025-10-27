import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:freelancer/core/networking/api_error_handler.dart';
import 'package:freelancer/core/networking/api_error_model.dart';
import 'package:freelancer/core/networking/api_services.dart';

import '../../../../core/widgets/data/models/settings_model.dart';

class AboutUsRepo {
  final ApiServices _apiServices;

  AboutUsRepo(this._apiServices);

  Future<Either<ApiErrorModel, SettingsResponseModel>> aboutUs() async {
    try {
      final response = await _apiServices.aboutUs();
      return Right(response);
    } catch (e) {
      log("error in about us $e");
      if (e is ApiErrorModel) {
        return Left(e);
      }
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
