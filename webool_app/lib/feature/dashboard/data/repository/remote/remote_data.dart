import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webool_network/webool_network.dart';
import 'package:webool_test/services/network_service_provider.dart';

// dashboardDataSoureceProvider  is used o provide data source for remote api
final dashboardDataSourceProvider =
    Provider.family<DashboardApiDataSource, NetworkService>(
        (_, networkService) => DashboardAPIDataSourceImpl(networkService));

// dashboardRepositoryProvider is used to provide repo methods to get methods for api call
final dashBoardRepositoryProvider = Provider<DashBoardApi>(
  (ref) {
    final NetworkService networkService = ref.watch(netwokServiceProvider);
    final dataSource = ref.watch(dashboardDataSourceProvider(networkService));
    return RemoteApiImpl(dataSource: dataSource);
  },
);

// DashoardApi is used to provide abstact methods  call dashboard apis
abstract class DashBoardApi {
  // GetSymbol Is used to get list of curreny list
  Future<Either<AppException, NetworkResponse>> getSymbols();

  // GetSymbolrate method is used to get rate of currecny
  Future<Either<AppException, NetworkResponse>> getSymbolsRates(
      {required Map<String, dynamic> data});
}

// RemoteApiIMpl is used to implement DashboardApi methods to use it with dataSource and get response from remote server
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
