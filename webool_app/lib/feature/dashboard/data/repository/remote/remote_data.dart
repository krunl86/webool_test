import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webool_network/webool_network.dart';
import 'package:webool_test/services/network_service_provider.dart';

final dashboardDataSourceProvider =
    Provider.family<DashboardApiDataSource, NetworkService>(
        (_, networkService) => DashboardAPIDataSourceImpl(networkService));

final dashBoardRepositoryProvider = Provider<DashBoardApi>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    final dataSource = ref.watch(dashboardDataSourceProvider(networkService));
    return RemoteApiImpl(dataSource: dataSource);
  },
);

abstract class DashBoardApi {
  Future<Either<AppException, NetworkResponse>> getSymbols();
  Future<Either<AppException, NetworkResponse>> getSymbolsRates(
      {required Map<String, dynamic> data});
}

class RemoteApiImpl extends DashBoardApi {
  DashboardApiDataSource dataSource;
  RemoteApiImpl({required this.dataSource});

  @override
  Future<Either<AppException, NetworkResponse>> getSymbols() {
    return dataSource.getSymbols();
  }

  @override
  Future<Either<AppException, NetworkResponse>> getSymbolsRates(
      {required Map<String, dynamic> data}) {
    return dataSource.getSymbolsRates(data: data);
  }
}
