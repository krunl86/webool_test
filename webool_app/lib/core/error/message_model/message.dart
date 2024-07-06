import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'message.freezed.dart';

@freezed
class Message with _$Message {
  const factory Message({
    Duration? duration,
    required WidgetBuilder builder,
  }) = _Message;
}
