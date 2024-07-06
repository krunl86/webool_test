import 'package:webool_network/webool_network.dart';

abstract class DashboardApiDataSource {
  Future<Either<AppException, NetworkResponse>> getSymbols();
  Future<Either<AppException, NetworkResponse>> getSymbolsRates(
      {required Map<String, dynamic> data});
}

class DashboardAPIDataSourceImpl extends DashboardApiDataSource {
  final NetworkService networkService;
  DashboardAPIDataSourceImpl(this.networkService);

  @override
  Future<Either<AppException, NetworkResponse>> getSymbols() async {
    try {
      final eitherType = await networkService.get(
        'symbols',
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, NetworkResponse>> getSymbolsRates(
      {required Map<String, dynamic> data}) async {
    try {
      final eitherType =
          await networkService.get('latest', queryParameters: data);
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }
}
