import 'package:dartz/dartz.dart';

import '../exceptions/http_exception.dart';

class NetworkResponse {
  final int statusCode;
  final String? statusMessage;
  final dynamic data;

  NetworkResponse(
      {required this.statusCode, this.statusMessage, this.data = const {}});
  @override
  String toString() {
    return 'statusCode=$statusCode\nstatusMessage=$statusMessage\n data=$data';
  }
}

extension ResponseExtension on NetworkResponse {
  Right<AppException, NetworkResponse> get toRight => Right(this);
}
