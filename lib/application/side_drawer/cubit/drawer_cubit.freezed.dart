// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'drawer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DrawerStateTearOff {
  const _$DrawerStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _AtSignLoaded atSignLoaded(Option<String> atSign) {
    return _AtSignLoaded(
      atSign,
    );
  }
}

/// @nodoc
const $DrawerState = _$DrawerStateTearOff();

/// @nodoc
mixin _$DrawerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Option<String> atSign) atSignLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Option<String> atSign)? atSignLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Option<String> atSign)? atSignLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AtSignLoaded value) atSignLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AtSignLoaded value)? atSignLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AtSignLoaded value)? atSignLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawerStateCopyWith<$Res> {
  factory $DrawerStateCopyWith(
          DrawerState value, $Res Function(DrawerState) then) =
      _$DrawerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DrawerStateCopyWithImpl<$Res> implements $DrawerStateCopyWith<$Res> {
  _$DrawerStateCopyWithImpl(this._value, this._then);

  final DrawerState _value;
  // ignore: unused_field
  final $Res Function(DrawerState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$DrawerStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'DrawerState.initial()';
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
    required TResult Function(Option<String> atSign) atSignLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Option<String> atSign)? atSignLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Option<String> atSign)? atSignLoaded,
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
    required TResult Function(_AtSignLoaded value) atSignLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AtSignLoaded value)? atSignLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AtSignLoaded value)? atSignLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DrawerState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$AtSignLoadedCopyWith<$Res> {
  factory _$AtSignLoadedCopyWith(
          _AtSignLoaded value, $Res Function(_AtSignLoaded) then) =
      __$AtSignLoadedCopyWithImpl<$Res>;
  $Res call({Option<String> atSign});
}

/// @nodoc
class __$AtSignLoadedCopyWithImpl<$Res> extends _$DrawerStateCopyWithImpl<$Res>
    implements _$AtSignLoadedCopyWith<$Res> {
  __$AtSignLoadedCopyWithImpl(
      _AtSignLoaded _value, $Res Function(_AtSignLoaded) _then)
      : super(_value, (v) => _then(v as _AtSignLoaded));

  @override
  _AtSignLoaded get _value => super._value as _AtSignLoaded;

  @override
  $Res call({
    Object? atSign = freezed,
  }) {
    return _then(_AtSignLoaded(
      atSign == freezed
          ? _value.atSign
          : atSign // ignore: cast_nullable_to_non_nullable
              as Option<String>,
    ));
  }
}

/// @nodoc

class _$_AtSignLoaded implements _AtSignLoaded {
  const _$_AtSignLoaded(this.atSign);

  @override
  final Option<String> atSign;

  @override
  String toString() {
    return 'DrawerState.atSignLoaded(atSign: $atSign)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AtSignLoaded &&
            const DeepCollectionEquality().equals(other.atSign, atSign));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(atSign));

  @JsonKey(ignore: true)
  @override
  _$AtSignLoadedCopyWith<_AtSignLoaded> get copyWith =>
      __$AtSignLoadedCopyWithImpl<_AtSignLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Option<String> atSign) atSignLoaded,
  }) {
    return atSignLoaded(atSign);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Option<String> atSign)? atSignLoaded,
  }) {
    return atSignLoaded?.call(atSign);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Option<String> atSign)? atSignLoaded,
    required TResult orElse(),
  }) {
    if (atSignLoaded != null) {
      return atSignLoaded(atSign);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AtSignLoaded value) atSignLoaded,
  }) {
    return atSignLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AtSignLoaded value)? atSignLoaded,
  }) {
    return atSignLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AtSignLoaded value)? atSignLoaded,
    required TResult orElse(),
  }) {
    if (atSignLoaded != null) {
      return atSignLoaded(this);
    }
    return orElse();
  }
}

abstract class _AtSignLoaded implements DrawerState {
  const factory _AtSignLoaded(Option<String> atSign) = _$_AtSignLoaded;

  Option<String> get atSign;
  @JsonKey(ignore: true)
  _$AtSignLoadedCopyWith<_AtSignLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
