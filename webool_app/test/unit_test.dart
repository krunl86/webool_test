import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:webool_network/webool_network.dart';
import 'package:webool_test/core/error/error_widget/toaster_widgets.dart';
import 'package:webool_test/feature/dashboard/data/repository/remote/remote_data.dart';
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
      // Arrange
      final expectedResponse = MockNetworkResponse();
      when(symbolsService.getSymbols())
          .thenAnswer((_) async => Right(expectedResponse));

      // Act
      final result = await symbolsService.getSymbols();

      // Assert
      expect(result, Right(expectedResponse));
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

    test('getSymbols calls getSymbols on DashBoardApi and updates controller',
        () async {
      // Mock response data
      final responseData = {
        'data': {
          'currenceList': [
            {'symbol': 'USD'},
            {'symbol': 'EUR'},
            // Add more symbols as needed
          ]
        }
      };

      // Mock API call response
      when(dashboardUseCase.getSymbols())
          .thenAnswer((_) async => Right(responseData));

      // Ensure currencySymbols is null initially
      when(mockDashboardController.currencySymbols).thenReturn(null);

      // Call the method under test
      dashboardUseCase.getSymbols();

      // Verify that getSymbols() was called exactly once
      verify(mockDashBoardApi.getSymbols()).called(1);

      // Verify that updateCurrencyList was called with the correct symbols
      verify(mockDashboardController.updateCurrencyList(any)).called(1);

      // You can also verify that messageService.addError was not called
      // verifyNever(mockMessageService.addError(any)).called(0);
    });
  });
}
