import 'dart:developer';

import 'fetch_data_exception.dart';

class AppException implements Exception {
  final String? code;
  final String? message;
  final Object? data;
  final StackTrace? stackTrace;

  AppException({
    this.code,
    this.message,
    this.data,
    this.stackTrace,
  });

  @override
  String toString() {
    return "$message";
  }

  static Exception handleError(Object e, StackTrace s) {
    log('$e', error: e, stackTrace: s);
    if (e is NoSuchMethodError) {
      throw AppException(message: 'Parsing failed', data: e, stackTrace: s);
    } else if (e is FetchDataException) {
      throw AppException(message: '$e', data: e, stackTrace: s);
    } else if (e is TypeError) {
      throw AppException(message: 'Data types do not match');
    } else {
      throw AppException(message: 'Something wrong', data: e, stackTrace: s);
    }
  }
}
