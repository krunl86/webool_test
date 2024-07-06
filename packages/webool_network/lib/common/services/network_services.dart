import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:webool_network/common/model/responses.dart';

import '../exceptions/http_exception.dart';

abstract class NetworkService {
  String get baseUrl;
  String get token;
  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, NetworkResponse>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, NetworkResponse>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
