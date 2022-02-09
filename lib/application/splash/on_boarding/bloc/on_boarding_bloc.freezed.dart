// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'on_boarding_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OnBoardingEventTearOff {
  const _$OnBoardingEventTearOff();

  OnBoardingAtSign onBoardingAtSign() {
    return const OnBoardingAtSign();
  }
}

/// @nodoc
const $OnBoardingEvent = _$OnBoardingEventTearOff();

/// @nodoc
mixin _$OnBoardingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onBoardingAtSign,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onBoardingAtSign,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onBoardingAtSign,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnBoardingAtSign value) onBoardingAtSign,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnBoardingAtSign value)? onBoardingAtSign,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnBoardingAtSign value)? onBoardingAtSign,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnBoardingEventCopyWith<$Res> {
  factory $OnBoardingEventCopyWith(
          OnBoardingEvent value, $Res Function(OnBoardingEvent) then) =
      _$OnBoardingEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnBoardingEventCopyWithImpl<$Res>
    implements $OnBoardingEventCopyWith<$Res> {
  _$OnBoardingEventCopyWithImpl(this._value, this._then);

  final OnBoardingEvent _value;
  // ignore: unused_field
  final $Res Function(OnBoardingEvent) _then;
}

/// @nodoc
abstract class $OnBoardingAtSignCopyWith<$Res> {
  factory $OnBoardingAtSignCopyWith(
          OnBoardingAtSign value, $Res Function(OnBoardingAtSign) then) =
      _$OnBoardingAtSignCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnBoardingAtSignCopyWithImpl<$Res>
    extends _$OnBoardingEventCopyWithImpl<$Res>
    implements $OnBoardingAtSignCopyWith<$Res> {
  _$OnBoardingAtSignCopyWithImpl(
      OnBoardingAtSign _value, $Res Function(OnBoardingAtSign) _then)
      : super(_value, (v) => _then(v as OnBoardingAtSign));

  @override
  OnBoardingAtSign get _value => super._value as OnBoardingAtSign;
}

/// @nodoc

class _$OnBoardingAtSign
    with DiagnosticableTreeMixin
    implements OnBoardingAtSign {
  const _$OnBoardingAtSign();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnBoardingEvent.onBoardingAtSign()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OnBoardingEvent.onBoardingAtSign'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OnBoardingAtSign);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onBoardingAtSign,
  }) {
    return onBoardingAtSign();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? onBoardingAtSign,
  }) {
    return onBoardingAtSign?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onBoardingAtSign,
    required TResult orElse(),
  }) {
    if (onBoardingAtSign != null) {
      return onBoardingAtSign();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnBoardingAtSign value) onBoardingAtSign,
  }) {
    return onBoardingAtSign(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnBoardingAtSign value)? onBoardingAtSign,
  }) {
    return onBoardingAtSign?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnBoardingAtSign value)? onBoardingAtSign,
    required TResult orElse(),
  }) {
    if (onBoardingAtSign != null) {
      return onBoardingAtSign(this);
    }
    return orElse();
  }
}

abstract class OnBoardingAtSign implements OnBoardingEvent {
  const factory OnBoardingAtSign() = _$OnBoardingAtSign;
}

/// @nodoc
class _$OnBoardingStateTearOff {
  const _$OnBoardingStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading(AtClientPreference atClientPreference) {
    return _Loading(
      atClientPreference,
    );
  }

  _Failure failure(OnBoardingFailure onBoardingFailure) {
    return _Failure(
      onBoardingFailure,
    );
  }

  _LoadSuccess loadSuccess() {
    return const _LoadSuccess();
  }
}

/// @nodoc
const $OnBoardingState = _$OnBoardingStateTearOff();

/// @nodoc
mixin _$OnBoardingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AtClientPreference atClientPreference) loading,
    required TResult Function(OnBoardingFailure onBoardingFailure) failure,
    required TResult Function() loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AtClientPreference atClientPreference)? loading,
    TResult Function(OnBoardingFailure onBoardingFailure)? failure,
    TResult Function()? loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AtClientPreference atClientPreference)? loading,
    TResult Function(OnBoardingFailure onBoardingFailure)? failure,
    TResult Function()? loadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_LoadSuccess value) loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_LoadSuccess value)? loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnBoardingStateCopyWith<$Res> {
  factory $OnBoardingStateCopyWith(
          OnBoardingState value, $Res Function(OnBoardingState) then) =
      _$OnBoardingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnBoardingStateCopyWithImpl<$Res>
    implements $OnBoardingStateCopyWith<$Res> {
  _$OnBoardingStateCopyWithImpl(this._value, this._then);

  final OnBoardingState _value;
  // ignore: unused_field
  final $Res Function(OnBoardingState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$OnBoardingStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnBoardingState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'OnBoardingState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AtClientPreference atClientPreference) loading,
    required TResult Function(OnBoardingFailure onBoardingFailure) failure,
    required TResult Function() loadSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AtClientPreference atClientPreference)? loading,
    TResult Function(OnBoardingFailure onBoardingFailure)? failure,
    TResult Function()? loadSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AtClientPreference atClientPreference)? loading,
    TResult Function(OnBoardingFailure onBoardingFailure)? failure,
    TResult Function()? loadSuccess,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_LoadSuccess value) loadSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_LoadSuccess value)? loadSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OnBoardingState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  $Res call({AtClientPreference atClientPreference});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$OnBoardingStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? atClientPreference = freezed,
  }) {
    return _then(_Loading(
      atClientPreference == freezed
          ? _value.atClientPreference
          : atClientPreference // ignore: cast_nullable_to_non_nullable
              as AtClientPreference,
    ));
  }
}

/// @nodoc

class _$_Loading with DiagnosticableTreeMixin implements _Loading {
  const _$_Loading(this.atClientPreference);

  @override
  final AtClientPreference atClientPreference;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnBoardingState.loading(atClientPreference: $atClientPreference)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OnBoardingState.loading'))
      ..add(DiagnosticsProperty('atClientPreference', atClientPreference));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality()
                .equals(other.atClientPreference, atClientPreference));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(atClientPreference));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AtClientPreference atClientPreference) loading,
    required TResult Function(OnBoardingFailure onBoardingFailure) failure,
    required TResult Function() loadSuccess,
  }) {
    return loading(atClientPreference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AtClientPreference atClientPreference)? loading,
    TResult Function(OnBoardingFailure onBoardingFailure)? failure,
    TResult Function()? loadSuccess,
  }) {
    return loading?.call(atClientPreference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AtClientPreference atClientPreference)? loading,
    TResult Function(OnBoardingFailure onBoardingFailure)? failure,
    TResult Function()? loadSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(atClientPreference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_LoadSuccess value) loadSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_LoadSuccess value)? loadSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements OnBoardingState {
  const factory _Loading(AtClientPreference atClientPreference) = _$_Loading;

  AtClientPreference get atClientPreference;
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailureCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  $Res call({OnBoardingFailure onBoardingFailure});

  $OnBoardingFailureCopyWith<$Res> get onBoardingFailure;
}

/// @nodoc
class __$FailureCopyWithImpl<$Res> extends _$OnBoardingStateCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(_Failure _value, $Res Function(_Failure) _then)
      : super(_value, (v) => _then(v as _Failure));

  @override
  _Failure get _value => super._value as _Failure;

  @override
  $Res call({
    Object? onBoardingFailure = freezed,
  }) {
    return _then(_Failure(
      onBoardingFailure == freezed
          ? _value.onBoardingFailure
          : onBoardingFailure // ignore: cast_nullable_to_non_nullable
              as OnBoardingFailure,
    ));
  }

  @override
  $OnBoardingFailureCopyWith<$Res> get onBoardingFailure {
    return $OnBoardingFailureCopyWith<$Res>(_value.onBoardingFailure, (value) {
      return _then(_value.copyWith(onBoardingFailure: value));
    });
  }
}

/// @nodoc

class _$_Failure with DiagnosticableTreeMixin implements _Failure {
  const _$_Failure(this.onBoardingFailure);

  @override
  final OnBoardingFailure onBoardingFailure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnBoardingState.failure(onBoardingFailure: $onBoardingFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OnBoardingState.failure'))
      ..add(DiagnosticsProperty('onBoardingFailure', onBoardingFailure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failure &&
            const DeepCollectionEquality()
                .equals(other.onBoardingFailure, onBoardingFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(onBoardingFailure));

  @JsonKey(ignore: true)
  @override
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AtClientPreference atClientPreference) loading,
    required TResult Function(OnBoardingFailure onBoardingFailure) failure,
    required TResult Function() loadSuccess,
  }) {
    return failure(onBoardingFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AtClientPreference atClientPreference)? loading,
    TResult Function(OnBoardingFailure onBoardingFailure)? failure,
    TResult Function()? loadSuccess,
  }) {
    return failure?.call(onBoardingFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AtClientPreference atClientPreference)? loading,
    TResult Function(OnBoardingFailure onBoardingFailure)? failure,
    TResult Function()? loadSuccess,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(onBoardingFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_LoadSuccess value) loadSuccess,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_LoadSuccess value)? loadSuccess,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements OnBoardingState {
  const factory _Failure(OnBoardingFailure onBoardingFailure) = _$_Failure;

  OnBoardingFailure get onBoardingFailure;
  @JsonKey(ignore: true)
  _$FailureCopyWith<_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$OnBoardingStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;
}

/// @nodoc

class _$_LoadSuccess with DiagnosticableTreeMixin implements _LoadSuccess {
  const _$_LoadSuccess();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnBoardingState.loadSuccess()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'OnBoardingState.loadSuccess'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(AtClientPreference atClientPreference) loading,
    required TResult Function(OnBoardingFailure onBoardingFailure) failure,
    required TResult Function() loadSuccess,
  }) {
    return loadSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AtClientPreference atClientPreference)? loading,
    TResult Function(OnBoardingFailure onBoardingFailure)? failure,
    TResult Function()? loadSuccess,
  }) {
    return loadSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(AtClientPreference atClientPreference)? loading,
    TResult Function(OnBoardingFailure onBoardingFailure)? failure,
    TResult Function()? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_LoadSuccess value) loadSuccess,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_LoadSuccess value)? loadSuccess,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements OnBoardingState {
  const factory _LoadSuccess() = _$_LoadSuccess;
}
