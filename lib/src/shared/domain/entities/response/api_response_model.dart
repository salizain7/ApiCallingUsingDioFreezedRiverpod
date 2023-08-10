import 'package:firstflutter/src/core/utils/constant/app_constants.dart';
import 'package:flutter/foundation.dart';

class ApiResponse<T> {
  ApiResponse({
    this.status,
    this.message,
    this.data,
  });

  late final bool? status;

  late final String? message;
  late final T? data;

  factory ApiResponse.fromJson(Map<dynamic, dynamic> json, tFromJson) {
    return ApiResponse<T>(
      status: json['status'],
      message: (json['message'] ?? unknownError).toString(),
      data: (tFromJson is! Function?)
          ? (tFromJson)
          : (json['data'] == null || tFromJson == null
              ? null
              : tFromJson(json['data'])),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is ApiResponse) {
      return other.status == status &&
              other.message == message &&
              other.data is List
          ? listEquals(other.data, data as List)
          : other.data == data;
    }

    return false;
  }
}
