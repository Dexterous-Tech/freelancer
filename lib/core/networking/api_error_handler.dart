import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(
            message: LocaleKeys.dioException_connectionInternet.tr(),
          );
        case DioExceptionType.cancel:
          return ApiErrorModel(
            message: LocaleKeys.dioException_requestCancelled.tr(),
          );
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
            message: LocaleKeys.dioException_connectionTimeout.tr(),
          );
        case DioExceptionType.unknown:
          return ApiErrorModel(
            message: LocaleKeys.dioException_connectionUnknown.tr(),
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: LocaleKeys.dioException_recivedTimeout.tr(),
          );
        case DioExceptionType.badResponse:
          return _handleBadResponse(error);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: LocaleKeys.dioException_sendTimeout.tr(),
          );
        default:
          return ApiErrorModel(
            message: LocaleKeys.dioException_unknownError.tr(),
          );
      }
    } else {
      return ApiErrorModel(message: LocaleKeys.dioException_unknownError.tr());
    }
  }

  static ApiErrorModel _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    try {
      if (data is Map<String, dynamic>) {
        return ApiErrorModel.fromJson(data, statusCode: statusCode);
      } else if (data is String) {
        try {
          final jsonData = jsonDecode(data) as Map<String, dynamic>;
          return ApiErrorModel.fromJson(jsonData, statusCode: statusCode);
        } catch (_) {
          return ApiErrorModel(
            message: data,
            statusCode: statusCode,
            rawData: data,
          );
        }
      }
    } catch (_) {
      return ApiErrorModel(
        message: LocaleKeys.dioException_unknownError.tr(),
        statusCode: statusCode,
        rawData: data,
      );
    }

    return ApiErrorModel(
      message: LocaleKeys.dioException_unknownError.tr(),
      statusCode: statusCode,
      rawData: data,
    );
  }
}
