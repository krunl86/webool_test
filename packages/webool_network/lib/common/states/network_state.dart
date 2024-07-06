import 'package:freezed_annotation/freezed_annotation.dart';

import '../exceptions/http_exception.dart';

part 'network_state.freezed.dart';

@freezed
abstract class NetworkState with _$NetworkState {
  const factory NetworkState.initial() = Initial;
  const factory NetworkState.loading() = Loading;
  const factory NetworkState.failure(AppException exception) = Failure;
  const factory NetworkState.success(dynamic message) = Success;
}
