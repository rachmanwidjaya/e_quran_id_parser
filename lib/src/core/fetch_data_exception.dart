import 'app_exception.dart';

class FetchDataException extends AppException {
  FetchDataException(
      {int? stausCode, String? message, Object? data, StackTrace? stackTrace})
      : super(
          code: '$stausCode',
          message: message,
          data: data,
          stackTrace: stackTrace,
        );

  @override
  String toString() => '$code: $message';
}
