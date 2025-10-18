import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../shared/shared_preferences_helper.dart';
import '../shared/shared_preferences_key.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? _dio;

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio()
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      await addDioHeaders(includeAuth: false);
      addDioInterceptor();
    }

    return _dio!;
  }

  static Future<void> addDioHeaders({bool includeAuth = true}) async {
    final String currentLang = await SharedPreferencesHelper.getSecuredString(
      SharedPreferencesKey.currentCodeKey,
    );

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'lang': currentLang,
    };
    if (includeAuth) {
      final String token = await SharedPreferencesHelper.getSecuredString(
        SharedPreferencesKey.apiTokenKey,
      );
      if (token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      } else {
        headers.remove('Authorization'); // Ensure no stale token is used
      }
    } else {
      headers.remove('Authorization'); // Explicitly remove auth header
    }
    _dio?.options.headers = headers;
    log("🔑 Headers before request: ${_dio?.options.headers}");
  }

  static Future<void> setTokenIntoHeaderAfterLogin(String token) async {
    final String currentLang = await SharedPreferencesHelper.getSecuredString(
      SharedPreferencesKey.currentCodeKey,
    );

    _dio?.options.headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'lang': currentLang,
    };
    // Force recreation of Dio instance
    log("🔑 Headers set after login: ${_dio?.options.headers}");
  }

  /// Update headers when language changes
  static Future<void> updateLanguageHeader(String currentLang) async {
    if (_dio != null) {
      // final String currentLang = await SharedPreferencesHelper.getSecuredString(
      //   SharedPreferencesKey.currentCodeKey,
      // );
      _dio!.options.headers['lang'] = currentLang;
      log("🔑 Language header updated: ${_dio?.options.headers['lang']}");
    }
  }

  static void addDioInterceptor() {
    _dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        request: true,
        error: true,
      ),
    );
  }
}
