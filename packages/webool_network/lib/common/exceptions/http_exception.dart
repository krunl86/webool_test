import 'package:dartz/dartz.dart';
import 'package:webool_network/common/model/responses.dart';

class AppException implements Exception {
  final String? message;
  final int? statusCode;
  final String? identifier;

  AppException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });
  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}

extension HttpExceptionExtension on AppException {
  Left<AppException, NetworkResponse> get toLeft =>
      Left<AppException, NetworkResponse>(this);
}
