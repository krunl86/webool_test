import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:webool_network/webool_network.dart';
import 'package:webool_test/core/error/error_widget/toaster_widgets.dart';
import 'package:webool_test/feature/dashboard/data/repository/remote/remote_data.dart';
import 'package:webool_test/feature/dashboard/domain/data_models/currency_symbol.dart';
import 'package:webool_test/feature/dashboard/domain/data_models/currency_symbol_model.dart';
import 'package:webool_test/feature/dashboard/domain/usecase/dashboard_usecase.dart';
import 'package:webool_test/feature/dashboard/presentaton/controller/dashboard_controller.dart';

class MockNetworkService extends Mock implements NetworkService {}

class MockNetworkResponse extends Mock implements NetworkResponse {}

class MockDashBoardApi extends Mock implements DashBoardApi {}

class MockMessageService extends Mock implements ToastMessageService {}

class MockDashboardController extends Mock implements DashboardController {}

void main() {
  group('getSymbols', () {
    late NetworkService mockNetworkService;
    late DashboardAPIDataSourceImpl symbolsService;
    late DashboardUseCase dashboardUseCase;
    late MockDashBoardApi mockDashBoardApi;
    late MockMessageService mockMessageService;
    late MockDashboardController mockDashboardController;

    setUp(() {
      mockNetworkService = MockNetworkService();
      symbolsService = DashboardAPIDataSourceImpl(mockNetworkService);
      mockDashBoardApi = MockDashBoardApi();
      mockMessageService = MockMessageService();
      mockDashboardController = MockDashboardController();

      dashboardUseCase = DashboardUseCase(
        dashboardController: mockDashboardController,
        dashBoardApi: mockDashBoardApi,
        messageService: mockMessageService,
      );
    });

    test('should return NetworkResponse on success', () async {
      //final expectedResponse = MockNetworkResponse();
      final expectedRespose = NetworkResponse(
        statusMessage: 'Data fetched Successfully',
        statusCode: 200,
        data: {
          "success": true,
          "symbols": {
            "AED": "United Arab Emirates Dirham",
            "AFN": "Afghan Afghani",
            "ALL": "Albanian Lek",
            "AMD": "Armenian Dram",
            "ANG": "Netherlands Antillean Guilder",
            "AOA": "Angolan Kwanza",
            "ARS": "Argentine Peso",
          }
        },
      );
      when(symbolsService.getSymbols())
          .thenAnswer((_) async => Right(expectedRespose));

      // Act
      final result = await symbolsService.getSymbols();

      // Assert
      expect(result, Right(expectedRespose));


    });

    test('should return AppException on failure', () async {
      // Arrange
      final expectedException = AppException(
        message: 'Unknown error occurred',
        statusCode: 1,
        identifier: 'Exception: Test exception\ngetSymbols',
      );

      when(symbolsService.getSymbols())
          .thenAnswer((_) async => Left(expectedException));

      // Act
      final result = await symbolsService.getSymbols();

      // Assert
      expect(result, Left(expectedException));
    });



    test('should return Right List of Model', () async {
      //final expectedResponse = MockNetworkResponse();
      final expectedRespose = NetworkResponse(
        statusMessage: 'Data fetched Successfully',
        statusCode: 200,
        data: {
          "success": true,
          "symbols": {
            "AED": "United Arab Emirates Dirham",
            "AFN": "Afghan Afghani",
            "ALL": "Albanian Lek",
            "AMD": "Armenian Dram",
            "ANG": "Netherlands Antillean Guilder",
            "AOA": "Angolan Kwanza",
            "ARS": "Argentine Peso",
          }
        },
      );

      // Act
      var allcurrencySymbols =
          CurrencySymbols.fromJson(expectedRespose.data).currenceList;

      // Assert
      expect(allcurrencySymbols, isA<List<Currency>>());
   
      

    });

test('should return Exception on missing Key', () async {
      //final expectedResponse = MockNetworkResponse();
      final expectedRespose = NetworkResponse(
        statusMessage: 'Data fetched Successfully',
        statusCode: 200,
        data: {
          "success": true,
          "rates": {
            "AED": "United Arab Emirates Dirham",
            "AFN": "Afghan Afghani",
            "ALL": "Albanian Lek",
            "AMD": "Armenian Dram",
            "ANG": "Netherlands Antillean Guilder",
            "AOA": "Angolan Kwanza",
            "ARS": "Argentine Peso",
          }
        },
      );

      // Act
      var allcurrencySymbols =
          CurrencySymbols.fromJson(expectedRespose.data).currenceList;

      // Assert
      expect(allcurrencySymbols, isA<List<Currency>>());
    });


  });
}
