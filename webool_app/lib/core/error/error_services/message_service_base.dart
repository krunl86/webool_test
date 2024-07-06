import 'dart:async';
import 'package:riverpod/riverpod.dart';
import '../message_model/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_service_base.freezed.dart';

const kDefaultMessageDuration = Duration(seconds: 3);

@freezed
class MessageServiceState with _$MessageServiceState {
  const MessageServiceState._();

  factory MessageServiceState.initial() => const MessageServiceState(
        timer: null,
        queue: [],
      );

  const factory MessageServiceState({
    required Timer? timer,
    required List<Message> queue,
  }) = _MessageServiceState;

  Message? get currentMessage {
    if (queue.isEmpty) return null;
    return queue.first;
  }
}

class MessageServiceBase extends StateNotifier<MessageServiceState> {
  MessageServiceBase() : super(MessageServiceState.initial());

  void add(Message message) {
    final queue = [
      ...state.queue,
      message,
    ];
    final maybeTimer = state.queue.isEmpty
        ? message.duration != null
            ? Timer(message.duration!, dismiss)
            : null
        : null;

    state = state.copyWith(
      queue: queue,
      timer: maybeTimer,
    );
  }

  void dismiss() {
    if (state.queue.isNotEmpty) {
      final queue = state.queue.skip(1).toList();
      final timer = queue.isNotEmpty
          ? Timer(queue.first.duration ?? Duration.zero, dismiss)
          : null;
      state = state.copyWith(
        queue: queue,
        timer: timer,
      );
    }
  }

  void dismissLoader() {
    state = state.copyWith(
      queue: [],
      timer: null,
    );
  }
}
