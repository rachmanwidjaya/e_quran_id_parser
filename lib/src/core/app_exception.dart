class AppException implements Exception {
  final String? code;
  final String? message;
  final Object? data;

  AppException({this.code, this.message, this.data});

  @override
  String toString() {
    return "$message";
  }
}
