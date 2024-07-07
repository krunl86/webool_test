import 'package:riverpod/riverpod.dart';
import 'package:webool_test/core/error/error_widget/toaster_widgets.dart';
import 'package:webool_test/feature/dashboard/presentaton/controller/dashboard_controller.dart';

import '../../data/database/database.dart';
import '../../data/repository/remote/remote_data.dart';
import '../data_models/currency_symbol_model.dart';

// dashboarduseCaseProvide is used to provide referecne to Usecases for dashboard page functionaly
final dashboardUseCaseProvider = StateProvider<DashboardUseCase>((ref) {
  return DashboardUseCase(
      dashboardController: ref.watch(dashBoardingController),
      dashBoardApi: ref.watch(dashBoardRepositoryProvider),
      messageService: ref.watch(toastMessageServiceProvider.notifier),
      ref: ref);
});

/*

  DashbaorduserCase class
  this is used to provide functionally needed to executed or happend from dashboard page
  it will mainly contain 3 functions
  1 . get list of currency and coutry
  2 . get list of currency rate based on base currency and selected currecy
  3 .  total calcualation funtion to summerized the selected currency in base currency
*/
class DashboardUseCase {
  DashboardUseCase({
    required this.dashboardController, // dashbaord controller used to notifiy UI
    this.dashBoardApi, // dashboardAPi is repository used to call remote API
    required this.messageService, // Message service is used to show loaders and error and success messages
    this.ref,
  });
  final DashboardController dashboardController;
  DashBoardApi? dashBoardApi;
  final ToastMessageService messageService;
  final Ref? ref;

  // getSymbols used to get list of currency avalable on platform
  void getSymbols() async {
    // added condtion to check is currencySybols aredy fetched or not
    // its used to reduce api call as it return same data every time so no need to call api every time
    // is called only once every time app open
    if (dashboardController.currencySymbols == null) {
      // enabled loader on screen
      messageService.addLoader();
      // create database instance
      var database = await ref?.watch(databaseProvider.future);
      // fetching list locally
      var list = await database!.userDao.getAllSymbol();

      // if list is not empty avoid network call
      if (list.isNotEmpty) {
        dashboardController.updateCurrencyList(list);
        // dismissing loader
        messageService.dismissLoader();

        // return function no need to procced further.
        return;
      }
      // fetching data from Server
   
      var res = await dashBoardApi?.getSymbols();
      messageService.dismissLoader(); // dismissing loader

      // sued Either package to manage success and error response from server
      res?.fold(
        (error) {
          // error will be executed if method get any error while completing operation of fetching data
          messageService.addError(error.message ?? 'something went wrong');
        },
        (respose) async {
          // response return success from server
          // it will contain 3 params status code, message and data

          var allcurrencySymbols = CurrencySymbols.fromJson(respose.data)
              .currenceList; // converting json to currecny List
          database!.userDao.insertSymbol(allcurrencySymbols!);

          // Updating list of currency and updating and  refresing UI
          dashboardController.updateCurrencyList(allcurrencySymbols);
        },
      );
    }
  }

  // Get Symbolrates function used to get list of currency Rates
  void getSymbolsRates() async {
    // this function take 2 inputs
    // 1. base currency which is used to get converted price rate compared with base currency
    // 2. list of currency codes as string format with joined with comma
    messageService.addLoader(); // showing loader
    var res = await dashBoardApi?.getSymbolsRates(data: {
      'base': dashboardController.baseCurrency?.currencyCode,
      'symbols':
          dashboardController.addedcurrency.map((e) => e.currency).join(', ')
    });
    messageService.dismissLoader(); // dismissing loader
    res?.fold(
      (error) {
        // showing error on screen
        messageService.addError(error.message ?? 'something went wrong');
      },
      (respose) {
        // updating list of currency rate based on given input
        var allcurrencyRate = CurrencySymbolsRate.fromJson(
          respose.data,
          dashboardController.allcurrencySymbols,
        ).currencyRate;
        dashboardController.currencySymbolsRates = allcurrencyRate;

        // caclucateTotal will do actually price calculationg
        calculateTotal();
      },
    );
  }

  void calculateTotal() {
    double total = 0.0; // initial amount

    // for loop is used to get individual currency code from added currency
    for (var selectedCurrency in dashboardController.addedcurrency) {
      // getting currency Rate based on selected base currency
      var countryRate = dashboardController.currencySymbolsRates!.firstWhere(
          (element) => element.currencyCode == selectedCurrency.currency);

      // correny Rate
      selectedCurrency.rate = countryRate.currencyRate.toString();
      // coutnry name
      selectedCurrency.country = countryRate.contryName;
      // actually calculation happen here
      // getting currency Rate from selecteddCurrecny
      var valueAfterCal = (countryRate.currencyRate ?? 0.0) *
          (selectedCurrency.number ??
              0); // multiplying currency rate with givean value

      total += valueAfterCal; //adding tatal
      dashboardController.updatedTotal(
          total); // updating total in dashboad Controller to update UI
      messageService
          .addSuccess('Successfully Calculated'); // showing success message
    }
  }
}
