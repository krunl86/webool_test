// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_service_base.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessageServiceState {
  Timer? get timer => throw _privateConstructorUsedError;
  List<Message> get queue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageServiceStateCopyWith<MessageServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageServiceStateCopyWith<$Res> {
  factory $MessageServiceStateCopyWith(
          MessageServiceState value, $Res Function(MessageServiceState) then) =
      _$MessageServiceStateCopyWithImpl<$Res, MessageServiceState>;
  @useResult
  $Res call({Timer? timer, List<Message> queue});
}

/// @nodoc
class _$MessageServiceStateCopyWithImpl<$Res, $Val extends MessageServiceState>
    implements $MessageServiceStateCopyWith<$Res> {
  _$MessageServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timer = freezed,
    Object? queue = null,
  }) {
    return _then(_value.copyWith(
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      queue: null == queue
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageServiceStateImplCopyWith<$Res>
    implements $MessageServiceStateCopyWith<$Res> {
  factory _$$MessageServiceStateImplCopyWith(_$MessageServiceStateImpl value,
          $Res Function(_$MessageServiceStateImpl) then) =
      __$$MessageServiceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Timer? timer, List<Message> queue});
}

/// @nodoc
class __$$MessageServiceStateImplCopyWithImpl<$Res>
    extends _$MessageServiceStateCopyWithImpl<$Res, _$MessageServiceStateImpl>
    implements _$$MessageServiceStateImplCopyWith<$Res> {
  __$$MessageServiceStateImplCopyWithImpl(_$MessageServiceStateImpl _value,
      $Res Function(_$MessageServiceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timer = freezed,
    Object? queue = null,
  }) {
    return _then(_$MessageServiceStateImpl(
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      queue: null == queue
          ? _value._queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$MessageServiceStateImpl extends _MessageServiceState {
  const _$MessageServiceStateImpl(
      {required this.timer, required final List<Message> queue})
      : _queue = queue,
        super._();

  @override
  final Timer? timer;
  final List<Message> _queue;
  @override
  List<Message> get queue {
    if (_queue is EqualUnmodifiableListView) return _queue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queue);
  }

  @override
  String toString() {
    return 'MessageServiceState(timer: $timer, queue: $queue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageServiceStateImpl &&
            (identical(other.timer, timer) || other.timer == timer) &&
            const DeepCollectionEquality().equals(other._queue, _queue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, timer, const DeepCollectionEquality().hash(_queue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageServiceStateImplCopyWith<_$MessageServiceStateImpl> get copyWith =>
      __$$MessageServiceStateImplCopyWithImpl<_$MessageServiceStateImpl>(
          this, _$identity);
}

abstract class _MessageServiceState extends MessageServiceState {
  const factory _MessageServiceState(
      {required final Timer? timer,
      required final List<Message> queue}) = _$MessageServiceStateImpl;
  const _MessageServiceState._() : super._();

  @override
  Timer? get timer;
  @override
  List<Message> get queue;
  @override
  @JsonKey(ignore: true)
  _$$MessageServiceStateImplCopyWith<_$MessageServiceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
