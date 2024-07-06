import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:webool_network/common/model/responses.dart';

import '../exceptions/http_exception.dart';
import '../services/network_services.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, NetworkResponse>>
      handleException<T extends Object>(Future<dio.Response> Function() handler,
          {String endpoint = ''}) async {
    try {
      String? message;
      final res = await handler();
      if (res.data is List) {
      } else {
        message =
            Map<String, dynamic>.from(res.data as Map)['message'].toString();
      }

      return Right(
        NetworkResponse(
          statusCode: res.statusCode ?? 200,
          data: res.data,
          statusMessage: message ?? res.statusMessage,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      log(e.toString());

      switch (e.runtimeType) {
        case SocketException:
          e as SocketException;
          message = 'Unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at  $endpoint';
          break;

        case dio.DioException:
          e as dio.DioException;
          // var msg = e.response?.data?['message'] as String?;
          var expMsg = e.message;
          message = /*  msg != null && msg.isNotEmpty
              ? msg
              :  */
              expMsg != null && expMsg.isNotEmpty
                  ? expMsg
                  : 'Internal Error occured';
          statusCode = 1;
          identifier = 'DioException ${e.message} \nat  $endpoint';
          break;

        default:
          message = 'Unknown error occured';
          statusCode = 2;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
      }
      return Left(
        AppException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}
