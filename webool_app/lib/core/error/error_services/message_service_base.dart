import 'dart:async';
import 'package:riverpod/riverpod.dart';
import '../message_model/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_service_base.freezed.dart';

// Default Message Show Length
const kDefaultMessageDuration = Duration(seconds: 3);

// MessageService State Class is responsible for all Toast and loader and success fail msg showin and dismissing
// it will contain current state of Message Manager Widget
// There are 2 params in State 1: TImer and 2 QUeue (Which will be list of Messages)

@freezed
class MessageServiceState with _$MessageServiceState {
  const MessageServiceState._();

  factory MessageServiceState.initial() => const MessageServiceState(
        timer: null,
        queue: [],
      );

  // Factory Method to return Istance for MessageState
  const factory MessageServiceState({
    required Timer? timer,
    required List<Message> queue,
  }) = _MessageServiceState;

  // Current Message will be responsible to show current Message On screen which read by MessageManager
  Message? get currentMessage {
    // checking for current queue to return top message on screen.
    if (queue.isEmpty) return null;
    return queue.first;
  }
}

// MessageServiceBase class is resposible for maintain list of messages and
// proivde methods and mechanism to add and dismiss new msg in queue

class MessageServiceBase extends StateNotifier<MessageServiceState> {
  MessageServiceBase() : super(MessageServiceState.initial());

  // Add method will be responsible for addin new message in message queue
  // it will add all message in queue
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

  // Dismiss method will be used to dissmiss current message from the queue and from the UI
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
  // dismissLoader is used to dissmiss all Loader msg from the queue
  void dismissLoader() {
    state = state.copyWith(
      queue: [],
      timer: null,
    );
  }
}
