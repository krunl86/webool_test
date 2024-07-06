import 'package:riverpod/riverpod.dart';
import 'package:webool_network/webool_network.dart';

final netwokServiceProvider = Provider<DioNetworkService>(
  (ref) {
    return DioNetworkService();
  },
);
