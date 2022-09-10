// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trivia_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TriviaEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() next,
    required TResult Function(String answer) answer,
    required TResult Function() timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? next,
    TResult Function(String answer)? answer,
    TResult Function()? timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? next,
    TResult Function(String answer)? answer,
    TResult Function()? timeout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TriviaEventNext value) next,
    required TResult Function(_TriviaEventAnswer value) answer,
    required TResult Function(_TriviaEventTimeout value) timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TriviaEventNext value)? next,
    TResult Function(_TriviaEventAnswer value)? answer,
    TResult Function(_TriviaEventTimeout value)? timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TriviaEventNext value)? next,
    TResult Function(_TriviaEventAnswer value)? answer,
    TResult Function(_TriviaEventTimeout value)? timeout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriviaEventCopyWith<$Res> {
  factory $TriviaEventCopyWith(
          TriviaEvent value, $Res Function(TriviaEvent) then) =
      _$TriviaEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TriviaEventCopyWithImpl<$Res> implements $TriviaEventCopyWith<$Res> {
  _$TriviaEventCopyWithImpl(this._value, this._then);

  final TriviaEvent _value;
  // ignore: unused_field
  final $Res Function(TriviaEvent) _then;
}

/// @nodoc
abstract class _$$_TriviaEventNextCopyWith<$Res> {
  factory _$$_TriviaEventNextCopyWith(
          _$_TriviaEventNext value, $Res Function(_$_TriviaEventNext) then) =
      __$$_TriviaEventNextCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TriviaEventNextCopyWithImpl<$Res>
    extends _$TriviaEventCopyWithImpl<$Res>
    implements _$$_TriviaEventNextCopyWith<$Res> {
  __$$_TriviaEventNextCopyWithImpl(
      _$_TriviaEventNext _value, $Res Function(_$_TriviaEventNext) _then)
      : super(_value, (v) => _then(v as _$_TriviaEventNext));

  @override
  _$_TriviaEventNext get _value => super._value as _$_TriviaEventNext;
}

/// @nodoc

class _$_TriviaEventNext implements _TriviaEventNext {
  _$_TriviaEventNext();

  @override
  String toString() {
    return 'TriviaEvent.next()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TriviaEventNext);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() next,
    required TResult Function(String answer) answer,
    required TResult Function() timeout,
  }) {
    return next();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? next,
    TResult Function(String answer)? answer,
    TResult Function()? timeout,
  }) {
    return next?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? next,
    TResult Function(String answer)? answer,
    TResult Function()? timeout,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TriviaEventNext value) next,
    required TResult Function(_TriviaEventAnswer value) answer,
    required TResult Function(_TriviaEventTimeout value) timeout,
  }) {
    return next(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TriviaEventNext value)? next,
    TResult Function(_TriviaEventAnswer value)? answer,
    TResult Function(_TriviaEventTimeout value)? timeout,
  }) {
    return next?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TriviaEventNext value)? next,
    TResult Function(_TriviaEventAnswer value)? answer,
    TResult Function(_TriviaEventTimeout value)? timeout,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next(this);
    }
    return orElse();
  }
}

abstract class _TriviaEventNext implements TriviaEvent {
  factory _TriviaEventNext() = _$_TriviaEventNext;
}

/// @nodoc
abstract class _$$_TriviaEventAnswerCopyWith<$Res> {
  factory _$$_TriviaEventAnswerCopyWith(_$_TriviaEventAnswer value,
          $Res Function(_$_TriviaEventAnswer) then) =
      __$$_TriviaEventAnswerCopyWithImpl<$Res>;
  $Res call({String answer});
}

/// @nodoc
class __$$_TriviaEventAnswerCopyWithImpl<$Res>
    extends _$TriviaEventCopyWithImpl<$Res>
    implements _$$_TriviaEventAnswerCopyWith<$Res> {
  __$$_TriviaEventAnswerCopyWithImpl(
      _$_TriviaEventAnswer _value, $Res Function(_$_TriviaEventAnswer) _then)
      : super(_value, (v) => _then(v as _$_TriviaEventAnswer));

  @override
  _$_TriviaEventAnswer get _value => super._value as _$_TriviaEventAnswer;

  @override
  $Res call({
    Object? answer = freezed,
  }) {
    return _then(_$_TriviaEventAnswer(
      answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TriviaEventAnswer implements _TriviaEventAnswer {
  _$_TriviaEventAnswer(this.answer);

  @override
  final String answer;

  @override
  String toString() {
    return 'TriviaEvent.answer(answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriviaEventAnswer &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  _$$_TriviaEventAnswerCopyWith<_$_TriviaEventAnswer> get copyWith =>
      __$$_TriviaEventAnswerCopyWithImpl<_$_TriviaEventAnswer>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() next,
    required TResult Function(String answer) answer,
    required TResult Function() timeout,
  }) {
    return answer(this.answer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? next,
    TResult Function(String answer)? answer,
    TResult Function()? timeout,
  }) {
    return answer?.call(this.answer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? next,
    TResult Function(String answer)? answer,
    TResult Function()? timeout,
    required TResult orElse(),
  }) {
    if (answer != null) {
      return answer(this.answer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TriviaEventNext value) next,
    required TResult Function(_TriviaEventAnswer value) answer,
    required TResult Function(_TriviaEventTimeout value) timeout,
  }) {
    return answer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TriviaEventNext value)? next,
    TResult Function(_TriviaEventAnswer value)? answer,
    TResult Function(_TriviaEventTimeout value)? timeout,
  }) {
    return answer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TriviaEventNext value)? next,
    TResult Function(_TriviaEventAnswer value)? answer,
    TResult Function(_TriviaEventTimeout value)? timeout,
    required TResult orElse(),
  }) {
    if (answer != null) {
      return answer(this);
    }
    return orElse();
  }
}

abstract class _TriviaEventAnswer implements TriviaEvent {
  factory _TriviaEventAnswer(final String answer) = _$_TriviaEventAnswer;

  String get answer;
  @JsonKey(ignore: true)
  _$$_TriviaEventAnswerCopyWith<_$_TriviaEventAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TriviaEventTimeoutCopyWith<$Res> {
  factory _$$_TriviaEventTimeoutCopyWith(_$_TriviaEventTimeout value,
          $Res Function(_$_TriviaEventTimeout) then) =
      __$$_TriviaEventTimeoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TriviaEventTimeoutCopyWithImpl<$Res>
    extends _$TriviaEventCopyWithImpl<$Res>
    implements _$$_TriviaEventTimeoutCopyWith<$Res> {
  __$$_TriviaEventTimeoutCopyWithImpl(
      _$_TriviaEventTimeout _value, $Res Function(_$_TriviaEventTimeout) _then)
      : super(_value, (v) => _then(v as _$_TriviaEventTimeout));

  @override
  _$_TriviaEventTimeout get _value => super._value as _$_TriviaEventTimeout;
}

/// @nodoc

class _$_TriviaEventTimeout implements _TriviaEventTimeout {
  _$_TriviaEventTimeout();

  @override
  String toString() {
    return 'TriviaEvent.timeout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TriviaEventTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() next,
    required TResult Function(String answer) answer,
    required TResult Function() timeout,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? next,
    TResult Function(String answer)? answer,
    TResult Function()? timeout,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? next,
    TResult Function(String answer)? answer,
    TResult Function()? timeout,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TriviaEventNext value) next,
    required TResult Function(_TriviaEventAnswer value) answer,
    required TResult Function(_TriviaEventTimeout value) timeout,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TriviaEventNext value)? next,
    TResult Function(_TriviaEventAnswer value)? answer,
    TResult Function(_TriviaEventTimeout value)? timeout,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TriviaEventNext value)? next,
    TResult Function(_TriviaEventAnswer value)? answer,
    TResult Function(_TriviaEventTimeout value)? timeout,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class _TriviaEventTimeout implements TriviaEvent {
  factory _TriviaEventTimeout() = _$_TriviaEventTimeout;
}

/// @nodoc
mixin _$TriviaState {
  bool get noUse => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  List<dynamic> get questions => throw _privateConstructorUsedError;
  AnswerState get answerState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TriviaStateCopyWith<TriviaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriviaStateCopyWith<$Res> {
  factory $TriviaStateCopyWith(
          TriviaState value, $Res Function(TriviaState) then) =
      _$TriviaStateCopyWithImpl<$Res>;
  $Res call(
      {bool noUse,
      int index,
      List<dynamic> questions,
      AnswerState answerState});

  $AnswerStateCopyWith<$Res> get answerState;
}

/// @nodoc
class _$TriviaStateCopyWithImpl<$Res> implements $TriviaStateCopyWith<$Res> {
  _$TriviaStateCopyWithImpl(this._value, this._then);

  final TriviaState _value;
  // ignore: unused_field
  final $Res Function(TriviaState) _then;

  @override
  $Res call({
    Object? noUse = freezed,
    Object? index = freezed,
    Object? questions = freezed,
    Object? answerState = freezed,
  }) {
    return _then(_value.copyWith(
      noUse: noUse == freezed
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      questions: questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      answerState: answerState == freezed
          ? _value.answerState
          : answerState // ignore: cast_nullable_to_non_nullable
              as AnswerState,
    ));
  }

  @override
  $AnswerStateCopyWith<$Res> get answerState {
    return $AnswerStateCopyWith<$Res>(_value.answerState, (value) {
      return _then(_value.copyWith(answerState: value));
    });
  }
}

/// @nodoc
abstract class _$$_TriviaStateCopyWith<$Res>
    implements $TriviaStateCopyWith<$Res> {
  factory _$$_TriviaStateCopyWith(
          _$_TriviaState value, $Res Function(_$_TriviaState) then) =
      __$$_TriviaStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool noUse,
      int index,
      List<dynamic> questions,
      AnswerState answerState});

  @override
  $AnswerStateCopyWith<$Res> get answerState;
}

/// @nodoc
class __$$_TriviaStateCopyWithImpl<$Res> extends _$TriviaStateCopyWithImpl<$Res>
    implements _$$_TriviaStateCopyWith<$Res> {
  __$$_TriviaStateCopyWithImpl(
      _$_TriviaState _value, $Res Function(_$_TriviaState) _then)
      : super(_value, (v) => _then(v as _$_TriviaState));

  @override
  _$_TriviaState get _value => super._value as _$_TriviaState;

  @override
  $Res call({
    Object? noUse = freezed,
    Object? index = freezed,
    Object? questions = freezed,
    Object? answerState = freezed,
  }) {
    return _then(_$_TriviaState(
      noUse: noUse == freezed
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      questions: questions == freezed
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      answerState: answerState == freezed
          ? _value.answerState
          : answerState // ignore: cast_nullable_to_non_nullable
              as AnswerState,
    ));
  }
}

/// @nodoc

class _$_TriviaState implements _TriviaState {
  const _$_TriviaState(
      {required this.noUse,
      required this.index,
      required final List<dynamic> questions,
      required this.answerState})
      : _questions = questions;

  @override
  final bool noUse;
  @override
  final int index;
  final List<dynamic> _questions;
  @override
  List<dynamic> get questions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final AnswerState answerState;

  @override
  String toString() {
    return 'TriviaState(noUse: $noUse, index: $index, questions: $questions, answerState: $answerState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TriviaState &&
            const DeepCollectionEquality().equals(other.noUse, noUse) &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            const DeepCollectionEquality()
                .equals(other.answerState, answerState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(noUse),
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(_questions),
      const DeepCollectionEquality().hash(answerState));

  @JsonKey(ignore: true)
  @override
  _$$_TriviaStateCopyWith<_$_TriviaState> get copyWith =>
      __$$_TriviaStateCopyWithImpl<_$_TriviaState>(this, _$identity);
}

abstract class _TriviaState implements TriviaState {
  const factory _TriviaState(
      {required final bool noUse,
      required final int index,
      required final List<dynamic> questions,
      required final AnswerState answerState}) = _$_TriviaState;

  @override
  bool get noUse;
  @override
  int get index;
  @override
  List<dynamic> get questions;
  @override
  AnswerState get answerState;
  @override
  @JsonKey(ignore: true)
  _$$_TriviaStateCopyWith<_$_TriviaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnswerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() correct,
    required TResult Function() inCorrect,
    required TResult Function() unAnswered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? correct,
    TResult Function()? inCorrect,
    TResult Function()? unAnswered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? correct,
    TResult Function()? inCorrect,
    TResult Function()? unAnswered,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnswerStateInitial value) initial,
    required TResult Function(_AnswerStateCorrect value) correct,
    required TResult Function(_AnswerStateInCorrect value) inCorrect,
    required TResult Function(_AnswerStateUnAnswered value) unAnswered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AnswerStateInitial value)? initial,
    TResult Function(_AnswerStateCorrect value)? correct,
    TResult Function(_AnswerStateInCorrect value)? inCorrect,
    TResult Function(_AnswerStateUnAnswered value)? unAnswered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnswerStateInitial value)? initial,
    TResult Function(_AnswerStateCorrect value)? correct,
    TResult Function(_AnswerStateInCorrect value)? inCorrect,
    TResult Function(_AnswerStateUnAnswered value)? unAnswered,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerStateCopyWith<$Res> {
  factory $AnswerStateCopyWith(
          AnswerState value, $Res Function(AnswerState) then) =
      _$AnswerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AnswerStateCopyWithImpl<$Res> implements $AnswerStateCopyWith<$Res> {
  _$AnswerStateCopyWithImpl(this._value, this._then);

  final AnswerState _value;
  // ignore: unused_field
  final $Res Function(AnswerState) _then;
}

/// @nodoc
abstract class _$$_AnswerStateInitialCopyWith<$Res> {
  factory _$$_AnswerStateInitialCopyWith(_$_AnswerStateInitial value,
          $Res Function(_$_AnswerStateInitial) then) =
      __$$_AnswerStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AnswerStateInitialCopyWithImpl<$Res>
    extends _$AnswerStateCopyWithImpl<$Res>
    implements _$$_AnswerStateInitialCopyWith<$Res> {
  __$$_AnswerStateInitialCopyWithImpl(
      _$_AnswerStateInitial _value, $Res Function(_$_AnswerStateInitial) _then)
      : super(_value, (v) => _then(v as _$_AnswerStateInitial));

  @override
  _$_AnswerStateInitial get _value => super._value as _$_AnswerStateInitial;
}

/// @nodoc

class _$_AnswerStateInitial implements _AnswerStateInitial {
  const _$_AnswerStateInitial();

  @override
  String toString() {
    return 'AnswerState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AnswerStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() correct,
    required TResult Function() inCorrect,
    required TResult Function() unAnswered,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? correct,
    TResult Function()? inCorrect,
    TResult Function()? unAnswered,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? correct,
    TResult Function()? inCorrect,
    TResult Function()? unAnswered,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnswerStateInitial value) initial,
    required TResult Function(_AnswerStateCorrect value) correct,
    required TResult Function(_AnswerStateInCorrect value) inCorrect,
    required TResult Function(_AnswerStateUnAnswered value) unAnswered,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AnswerStateInitial value)? initial,
    TResult Function(_AnswerStateCorrect value)? correct,
    TResult Function(_AnswerStateInCorrect value)? inCorrect,
    TResult Function(_AnswerStateUnAnswered value)? unAnswered,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnswerStateInitial value)? initial,
    TResult Function(_AnswerStateCorrect value)? correct,
    TResult Function(_AnswerStateInCorrect value)? inCorrect,
    TResult Function(_AnswerStateUnAnswered value)? unAnswered,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AnswerStateInitial implements AnswerState {
  const factory _AnswerStateInitial() = _$_AnswerStateInitial;
}

/// @nodoc
abstract class _$$_AnswerStateCorrectCopyWith<$Res> {
  factory _$$_AnswerStateCorrectCopyWith(_$_AnswerStateCorrect value,
          $Res Function(_$_AnswerStateCorrect) then) =
      __$$_AnswerStateCorrectCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AnswerStateCorrectCopyWithImpl<$Res>
    extends _$AnswerStateCopyWithImpl<$Res>
    implements _$$_AnswerStateCorrectCopyWith<$Res> {
  __$$_AnswerStateCorrectCopyWithImpl(
      _$_AnswerStateCorrect _value, $Res Function(_$_AnswerStateCorrect) _then)
      : super(_value, (v) => _then(v as _$_AnswerStateCorrect));

  @override
  _$_AnswerStateCorrect get _value => super._value as _$_AnswerStateCorrect;
}

/// @nodoc

class _$_AnswerStateCorrect implements _AnswerStateCorrect {
  const _$_AnswerStateCorrect();

  @override
  String toString() {
    return 'AnswerState.correct()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AnswerStateCorrect);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() correct,
    required TResult Function() inCorrect,
    required TResult Function() unAnswered,
  }) {
    return correct();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? correct,
    TResult Function()? inCorrect,
    TResult Function()? unAnswered,
  }) {
    return correct?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? correct,
    TResult Function()? inCorrect,
    TResult Function()? unAnswered,
    required TResult orElse(),
  }) {
    if (correct != null) {
      return correct();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnswerStateInitial value) initial,
    required TResult Function(_AnswerStateCorrect value) correct,
    required TResult Function(_AnswerStateInCorrect value) inCorrect,
    required TResult Function(_AnswerStateUnAnswered value) unAnswered,
  }) {
    return correct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AnswerStateInitial value)? initial,
    TResult Function(_AnswerStateCorrect value)? correct,
    TResult Function(_AnswerStateInCorrect value)? inCorrect,
    TResult Function(_AnswerStateUnAnswered value)? unAnswered,
  }) {
    return correct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnswerStateInitial value)? initial,
    TResult Function(_AnswerStateCorrect value)? correct,
    TResult Function(_AnswerStateInCorrect value)? inCorrect,
    TResult Function(_AnswerStateUnAnswered value)? unAnswered,
    required TResult orElse(),
  }) {
    if (correct != null) {
      return correct(this);
    }
    return orElse();
  }
}

abstract class _AnswerStateCorrect implements AnswerState {
  const factory _AnswerStateCorrect() = _$_AnswerStateCorrect;
}

/// @nodoc
abstract class _$$_AnswerStateInCorrectCopyWith<$Res> {
  factory _$$_AnswerStateInCorrectCopyWith(_$_AnswerStateInCorrect value,
          $Res Function(_$_AnswerStateInCorrect) then) =
      __$$_AnswerStateInCorrectCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AnswerStateInCorrectCopyWithImpl<$Res>
    extends _$AnswerStateCopyWithImpl<$Res>
    implements _$$_AnswerStateInCorrectCopyWith<$Res> {
  __$$_AnswerStateInCorrectCopyWithImpl(_$_AnswerStateInCorrect _value,
      $Res Function(_$_AnswerStateInCorrect) _then)
      : super(_value, (v) => _then(v as _$_AnswerStateInCorrect));

  @override
  _$_AnswerStateInCorrect get _value => super._value as _$_AnswerStateInCorrect;
}

/// @nodoc

class _$_AnswerStateInCorrect implements _AnswerStateInCorrect {
  const _$_AnswerStateInCorrect();

  @override
  String toString() {
    return 'AnswerState.inCorrect()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AnswerStateInCorrect);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() correct,
    required TResult Function() inCorrect,
    required TResult Function() unAnswered,
  }) {
    return inCorrect();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? correct,
    TResult Function()? inCorrect,
    TResult Function()? unAnswered,
  }) {
    return inCorrect?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? correct,
    TResult Function()? inCorrect,
    TResult Function()? unAnswered,
    required TResult orElse(),
  }) {
    if (inCorrect != null) {
      return inCorrect();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnswerStateInitial value) initial,
    required TResult Function(_AnswerStateCorrect value) correct,
    required TResult Function(_AnswerStateInCorrect value) inCorrect,
    required TResult Function(_AnswerStateUnAnswered value) unAnswered,
  }) {
    return inCorrect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AnswerStateInitial value)? initial,
    TResult Function(_AnswerStateCorrect value)? correct,
    TResult Function(_AnswerStateInCorrect value)? inCorrect,
    TResult Function(_AnswerStateUnAnswered value)? unAnswered,
  }) {
    return inCorrect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnswerStateInitial value)? initial,
    TResult Function(_AnswerStateCorrect value)? correct,
    TResult Function(_AnswerStateInCorrect value)? inCorrect,
    TResult Function(_AnswerStateUnAnswered value)? unAnswered,
    required TResult orElse(),
  }) {
    if (inCorrect != null) {
      return inCorrect(this);
    }
    return orElse();
  }
}

abstract class _AnswerStateInCorrect implements AnswerState {
  const factory _AnswerStateInCorrect() = _$_AnswerStateInCorrect;
}

/// @nodoc
abstract class _$$_AnswerStateUnAnsweredCopyWith<$Res> {
  factory _$$_AnswerStateUnAnsweredCopyWith(_$_AnswerStateUnAnswered value,
          $Res Function(_$_AnswerStateUnAnswered) then) =
      __$$_AnswerStateUnAnsweredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AnswerStateUnAnsweredCopyWithImpl<$Res>
    extends _$AnswerStateCopyWithImpl<$Res>
    implements _$$_AnswerStateUnAnsweredCopyWith<$Res> {
  __$$_AnswerStateUnAnsweredCopyWithImpl(_$_AnswerStateUnAnswered _value,
      $Res Function(_$_AnswerStateUnAnswered) _then)
      : super(_value, (v) => _then(v as _$_AnswerStateUnAnswered));

  @override
  _$_AnswerStateUnAnswered get _value =>
      super._value as _$_AnswerStateUnAnswered;
}

/// @nodoc

class _$_AnswerStateUnAnswered implements _AnswerStateUnAnswered {
  const _$_AnswerStateUnAnswered();

  @override
  String toString() {
    return 'AnswerState.unAnswered()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AnswerStateUnAnswered);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() correct,
    required TResult Function() inCorrect,
    required TResult Function() unAnswered,
  }) {
    return unAnswered();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? correct,
    TResult Function()? inCorrect,
    TResult Function()? unAnswered,
  }) {
    return unAnswered?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? correct,
    TResult Function()? inCorrect,
    TResult Function()? unAnswered,
    required TResult orElse(),
  }) {
    if (unAnswered != null) {
      return unAnswered();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnswerStateInitial value) initial,
    required TResult Function(_AnswerStateCorrect value) correct,
    required TResult Function(_AnswerStateInCorrect value) inCorrect,
    required TResult Function(_AnswerStateUnAnswered value) unAnswered,
  }) {
    return unAnswered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AnswerStateInitial value)? initial,
    TResult Function(_AnswerStateCorrect value)? correct,
    TResult Function(_AnswerStateInCorrect value)? inCorrect,
    TResult Function(_AnswerStateUnAnswered value)? unAnswered,
  }) {
    return unAnswered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnswerStateInitial value)? initial,
    TResult Function(_AnswerStateCorrect value)? correct,
    TResult Function(_AnswerStateInCorrect value)? inCorrect,
    TResult Function(_AnswerStateUnAnswered value)? unAnswered,
    required TResult orElse(),
  }) {
    if (unAnswered != null) {
      return unAnswered(this);
    }
    return orElse();
  }
}

abstract class _AnswerStateUnAnswered implements AnswerState {
  const factory _AnswerStateUnAnswered() = _$_AnswerStateUnAnswered;
}
