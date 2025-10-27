/*
* class change depend on error json return in response
* this I make before to check in all key error because error's key change
* */
class ApiErrorModel {
  final String? message;
  final Map<String, dynamic>? fieldErrors;
  final int? statusCode;
  final bool? showToast;
  final dynamic rawData;

  /// This new map holds the raw "data" field directly,
  /// so you can access values like data['phone_is_verified'].
  final Map<String, dynamic>? data;

  ApiErrorModel({
    this.message,
    this.fieldErrors,
    this.statusCode,
    this.showToast,
    this.rawData,
    this.data,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json, {int? statusCode}) {
    String? message;

    // Extract message
    final possibleMessageKeys = [
      'message',
      'detail',
      'error',
      'msg',
      'description',
    ];
    for (var key in possibleMessageKeys) {
      if (json.containsKey(key) && json[key] is String) {
        message = json[key];
        break;
      }
    }

    // Extract "data" (could be a map or something else)
    Map<String, dynamic>? data;
    if (json['data'] is Map<String, dynamic>) {
      data = Map<String, dynamic>.from(json['data']);
    }

    // Extract field-specific errors (if available)
    Map<String, dynamic>? fieldErrors;
    if (json['errors'] is Map<String, dynamic>) {
      fieldErrors = Map<String, dynamic>.from(json['errors']);
    } else if (data != null) {
      // Treat "data" as field errors only if it looks like that
      fieldErrors = Map<String, dynamic>.from(data);
    }

    return ApiErrorModel(
      message: message,
      fieldErrors: fieldErrors,
      statusCode: statusCode ?? json['status'] as int?,
      showToast: json['showToast'] as bool?,
      rawData: json,
      data: data,
    );
  }

  /// Returns a user-friendly message
  String get displayMessage {
    if (fieldErrors != null && fieldErrors!.isNotEmpty) {
      final messages = <String>[];
      fieldErrors!.forEach((key, value) {
        if (value is List && value.isNotEmpty) {
          messages.addAll(value.map((e) => e.toString()));
        } else if (value is String && value.isNotEmpty) {
          messages.add(value);
        }
      });
      if (messages.isNotEmpty) return messages.join('\n');
    }

    if (message != null && message!.isNotEmpty) return message!;

    if (statusCode != null) {
      return _getDefaultMessageForStatusCode(statusCode!);
    }

    return 'Unknown error occurred';
  }

  static String _getDefaultMessageForStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Resource not found';
      case 422:
        return 'Validation error';
      case 500:
        return 'Internal server error';
      default:
        return 'Unknown error occurred';
    }
  }

  @override
  String toString() =>
      'ApiErrorModel(message: $message, fieldErrors: $fieldErrors, data: $data, statusCode: $statusCode, showToast: $showToast, rawData: $rawData)';
}
