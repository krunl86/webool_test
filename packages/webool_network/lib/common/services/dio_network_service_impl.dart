import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../config/api_config.dart';
import '../exceptions/http_exception.dart';
import '../mixin/exception_handling_mixin.dart';
import '../model/responses.dart';
import 'network_services.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio = Dio();
  DioNetworkService() {
    dio.options = dioBaseOptions;
    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        //followRedirects: false,
      );
  @override
  String get baseUrl => AppConfigs.baseUrl;

  @override
  String get token => AppConfigs.staticToken;

  @override
  Map<String, Object> get headers => {
        'accept': '*/*',
        'content-type': 'application/json',
        'apikey': token,
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};

    dio.options.headers = header;

    return header;
  }

  @override
  Future<Either<AppException, NetworkResponse>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    var res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );

    return res;
  }

  @override
  Future<Either<AppException, NetworkResponse>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, NetworkResponse>> postFileUpload(String endpoint,
      {Map<String, dynamic>? data,
      List<File>? files,
      required bool isFormData}) async {
    var data1 = FormData.fromMap({
      'files': [
        await MultipartFile.fromFile(
          files![0].path,
        )
      ],
    });
    data?.forEach((key, value) {
      data1.fields.add(MapEntry(key, value));
    });

    final res = handleException(
      () => dio.post(
        endpoint,
        data: data1,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
