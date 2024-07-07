import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'message.freezed.dart';


// Message Model is data class for contain duration and builder widget for message service and message queue
@freezed
class Message with _$Message {
  const factory Message({
    Duration? duration,
    required WidgetBuilder builder,
  }) = _Message;
}
