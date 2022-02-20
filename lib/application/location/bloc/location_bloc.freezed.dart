// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocationEventTearOff {
  const _$LocationEventTearOff();

  _Started started(GlobalKey<NavigatorState> navKey) {
    return _Started(
      navKey,
    );
  }

  _LocationServicesInitialized locationServicesInitialized(
      Option<Position>? myPosition) {
    return _LocationServicesInitialized(
      myPosition,
    );
  }

  _LocationDataReceived locationDataReceived(Option<Position> myPosition) {
    return _LocationDataReceived(
      myPosition,
    );
  }
}

/// @nodoc
const $LocationEvent = _$LocationEventTearOff();

/// @nodoc
mixin _$LocationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GlobalKey<NavigatorState> navKey) started,
    required TResult Function(Option<Position>? myPosition)
        locationServicesInitialized,
    required TResult Function(Option<Position> myPosition) locationDataReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GlobalKey<NavigatorState> navKey)? started,
    TResult Function(Option<Position>? myPosition)? locationServicesInitialized,
    TResult Function(Option<Position> myPosition)? locationDataReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GlobalKey<NavigatorState> navKey)? started,
    TResult Function(Option<Position>? myPosition)? locationServicesInitialized,
    TResult Function(Option<Position> myPosition)? locationDataReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LocationServicesInitialized value)
        locationServicesInitialized,
    required TResult Function(_LocationDataReceived value) locationDataReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationServicesInitialized value)?
        locationServicesInitialized,
    TResult Function(_LocationDataReceived value)? locationDataReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationServicesInitialized value)?
        locationServicesInitialized,
    TResult Function(_LocationDataReceived value)? locationDataReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationEventCopyWith<$Res> {
  factory $LocationEventCopyWith(
          LocationEvent value, $Res Function(LocationEvent) then) =
      _$LocationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationEventCopyWithImpl<$Res>
    implements $LocationEventCopyWith<$Res> {
  _$LocationEventCopyWithImpl(this._value, this._then);

  final LocationEvent _value;
  // ignore: unused_field
  final $Res Function(LocationEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
  $Res call({GlobalKey<NavigatorState> navKey});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$LocationEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;

  @override
  $Res call({
    Object? navKey = freezed,
  }) {
    return _then(_Started(
      navKey == freezed
          ? _value.navKey
          : navKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<NavigatorState>,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started(this.navKey);

  @override
  final GlobalKey<NavigatorState> navKey;

  @override
  String toString() {
    return 'LocationEvent.started(navKey: $navKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Started &&
            const DeepCollectionEquality().equals(other.navKey, navKey));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(navKey));

  @JsonKey(ignore: true)
  @override
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GlobalKey<NavigatorState> navKey) started,
    required TResult Function(Option<Position>? myPosition)
        locationServicesInitialized,
    required TResult Function(Option<Position> myPosition) locationDataReceived,
  }) {
    return started(navKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GlobalKey<NavigatorState> navKey)? started,
    TResult Function(Option<Position>? myPosition)? locationServicesInitialized,
    TResult Function(Option<Position> myPosition)? locationDataReceived,
  }) {
    return started?.call(navKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GlobalKey<NavigatorState> navKey)? started,
    TResult Function(Option<Position>? myPosition)? locationServicesInitialized,
    TResult Function(Option<Position> myPosition)? locationDataReceived,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(navKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LocationServicesInitialized value)
        locationServicesInitialized,
    required TResult Function(_LocationDataReceived value) locationDataReceived,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationServicesInitialized value)?
        locationServicesInitialized,
    TResult Function(_LocationDataReceived value)? locationDataReceived,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationServicesInitialized value)?
        locationServicesInitialized,
    TResult Function(_LocationDataReceived value)? locationDataReceived,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements LocationEvent {
  const factory _Started(GlobalKey<NavigatorState> navKey) = _$_Started;

  GlobalKey<NavigatorState> get navKey;
  @JsonKey(ignore: true)
  _$StartedCopyWith<_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LocationServicesInitializedCopyWith<$Res> {
  factory _$LocationServicesInitializedCopyWith(
          _LocationServicesInitialized value,
          $Res Function(_LocationServicesInitialized) then) =
      __$LocationServicesInitializedCopyWithImpl<$Res>;
  $Res call({Option<Position>? myPosition});
}

/// @nodoc
class __$LocationServicesInitializedCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res>
    implements _$LocationServicesInitializedCopyWith<$Res> {
  __$LocationServicesInitializedCopyWithImpl(
      _LocationServicesInitialized _value,
      $Res Function(_LocationServicesInitialized) _then)
      : super(_value, (v) => _then(v as _LocationServicesInitialized));

  @override
  _LocationServicesInitialized get _value =>
      super._value as _LocationServicesInitialized;

  @override
  $Res call({
    Object? myPosition = freezed,
  }) {
    return _then(_LocationServicesInitialized(
      myPosition == freezed
          ? _value.myPosition
          : myPosition // ignore: cast_nullable_to_non_nullable
              as Option<Position>?,
    ));
  }
}

/// @nodoc

class _$_LocationServicesInitialized implements _LocationServicesInitialized {
  const _$_LocationServicesInitialized(this.myPosition);

  @override
  final Option<Position>? myPosition;

  @override
  String toString() {
    return 'LocationEvent.locationServicesInitialized(myPosition: $myPosition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationServicesInitialized &&
            const DeepCollectionEquality()
                .equals(other.myPosition, myPosition));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(myPosition));

  @JsonKey(ignore: true)
  @override
  _$LocationServicesInitializedCopyWith<_LocationServicesInitialized>
      get copyWith => __$LocationServicesInitializedCopyWithImpl<
          _LocationServicesInitialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GlobalKey<NavigatorState> navKey) started,
    required TResult Function(Option<Position>? myPosition)
        locationServicesInitialized,
    required TResult Function(Option<Position> myPosition) locationDataReceived,
  }) {
    return locationServicesInitialized(myPosition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GlobalKey<NavigatorState> navKey)? started,
    TResult Function(Option<Position>? myPosition)? locationServicesInitialized,
    TResult Function(Option<Position> myPosition)? locationDataReceived,
  }) {
    return locationServicesInitialized?.call(myPosition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GlobalKey<NavigatorState> navKey)? started,
    TResult Function(Option<Position>? myPosition)? locationServicesInitialized,
    TResult Function(Option<Position> myPosition)? locationDataReceived,
    required TResult orElse(),
  }) {
    if (locationServicesInitialized != null) {
      return locationServicesInitialized(myPosition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LocationServicesInitialized value)
        locationServicesInitialized,
    required TResult Function(_LocationDataReceived value) locationDataReceived,
  }) {
    return locationServicesInitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationServicesInitialized value)?
        locationServicesInitialized,
    TResult Function(_LocationDataReceived value)? locationDataReceived,
  }) {
    return locationServicesInitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationServicesInitialized value)?
        locationServicesInitialized,
    TResult Function(_LocationDataReceived value)? locationDataReceived,
    required TResult orElse(),
  }) {
    if (locationServicesInitialized != null) {
      return locationServicesInitialized(this);
    }
    return orElse();
  }
}

abstract class _LocationServicesInitialized implements LocationEvent {
  const factory _LocationServicesInitialized(Option<Position>? myPosition) =
      _$_LocationServicesInitialized;

  Option<Position>? get myPosition;
  @JsonKey(ignore: true)
  _$LocationServicesInitializedCopyWith<_LocationServicesInitialized>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LocationDataReceivedCopyWith<$Res> {
  factory _$LocationDataReceivedCopyWith(_LocationDataReceived value,
          $Res Function(_LocationDataReceived) then) =
      __$LocationDataReceivedCopyWithImpl<$Res>;
  $Res call({Option<Position> myPosition});
}

/// @nodoc
class __$LocationDataReceivedCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res>
    implements _$LocationDataReceivedCopyWith<$Res> {
  __$LocationDataReceivedCopyWithImpl(
      _LocationDataReceived _value, $Res Function(_LocationDataReceived) _then)
      : super(_value, (v) => _then(v as _LocationDataReceived));

  @override
  _LocationDataReceived get _value => super._value as _LocationDataReceived;

  @override
  $Res call({
    Object? myPosition = freezed,
  }) {
    return _then(_LocationDataReceived(
      myPosition == freezed
          ? _value.myPosition
          : myPosition // ignore: cast_nullable_to_non_nullable
              as Option<Position>,
    ));
  }
}

/// @nodoc

class _$_LocationDataReceived implements _LocationDataReceived {
  const _$_LocationDataReceived(this.myPosition);

  @override
  final Option<Position> myPosition;

  @override
  String toString() {
    return 'LocationEvent.locationDataReceived(myPosition: $myPosition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationDataReceived &&
            const DeepCollectionEquality()
                .equals(other.myPosition, myPosition));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(myPosition));

  @JsonKey(ignore: true)
  @override
  _$LocationDataReceivedCopyWith<_LocationDataReceived> get copyWith =>
      __$LocationDataReceivedCopyWithImpl<_LocationDataReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GlobalKey<NavigatorState> navKey) started,
    required TResult Function(Option<Position>? myPosition)
        locationServicesInitialized,
    required TResult Function(Option<Position> myPosition) locationDataReceived,
  }) {
    return locationDataReceived(myPosition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(GlobalKey<NavigatorState> navKey)? started,
    TResult Function(Option<Position>? myPosition)? locationServicesInitialized,
    TResult Function(Option<Position> myPosition)? locationDataReceived,
  }) {
    return locationDataReceived?.call(myPosition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GlobalKey<NavigatorState> navKey)? started,
    TResult Function(Option<Position>? myPosition)? locationServicesInitialized,
    TResult Function(Option<Position> myPosition)? locationDataReceived,
    required TResult orElse(),
  }) {
    if (locationDataReceived != null) {
      return locationDataReceived(myPosition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LocationServicesInitialized value)
        locationServicesInitialized,
    required TResult Function(_LocationDataReceived value) locationDataReceived,
  }) {
    return locationDataReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationServicesInitialized value)?
        locationServicesInitialized,
    TResult Function(_LocationDataReceived value)? locationDataReceived,
  }) {
    return locationDataReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationServicesInitialized value)?
        locationServicesInitialized,
    TResult Function(_LocationDataReceived value)? locationDataReceived,
    required TResult orElse(),
  }) {
    if (locationDataReceived != null) {
      return locationDataReceived(this);
    }
    return orElse();
  }
}

abstract class _LocationDataReceived implements LocationEvent {
  const factory _LocationDataReceived(Option<Position> myPosition) =
      _$_LocationDataReceived;

  Option<Position> get myPosition;
  @JsonKey(ignore: true)
  _$LocationDataReceivedCopyWith<_LocationDataReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$LocationStateTearOff {
  const _$LocationStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _ShowingMap showingMap(
      {LatLng? myLatLng,
      LatLng? previousLatLng,
      bool? contactsLoaded,
      bool? moveMap,
      Key? mapKey,
      required Option<Position> myposition,
      List<EventAndLocationHybrid>? allNotifications,
      List<EventAndLocationHybrid>? allLocationNotifications,
      List<EventAndLocationHybrid>? allEventNotifications,
      int? animateToIndex}) {
    return _ShowingMap(
      myLatLng: myLatLng,
      previousLatLng: previousLatLng,
      contactsLoaded: contactsLoaded,
      moveMap: moveMap,
      mapKey: mapKey,
      myposition: myposition,
      allNotifications: allNotifications,
      allLocationNotifications: allLocationNotifications,
      allEventNotifications: allEventNotifications,
      animateToIndex: animateToIndex,
    );
  }
}

/// @nodoc
const $LocationState = _$LocationStateTearOff();

/// @nodoc
mixin _$LocationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            LatLng? myLatLng,
            LatLng? previousLatLng,
            bool? contactsLoaded,
            bool? moveMap,
            Key? mapKey,
            Option<Position> myposition,
            List<EventAndLocationHybrid>? allNotifications,
            List<EventAndLocationHybrid>? allLocationNotifications,
            List<EventAndLocationHybrid>? allEventNotifications,
            int? animateToIndex)
        showingMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            LatLng? myLatLng,
            LatLng? previousLatLng,
            bool? contactsLoaded,
            bool? moveMap,
            Key? mapKey,
            Option<Position> myposition,
            List<EventAndLocationHybrid>? allNotifications,
            List<EventAndLocationHybrid>? allLocationNotifications,
            List<EventAndLocationHybrid>? allEventNotifications,
            int? animateToIndex)?
        showingMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            LatLng? myLatLng,
            LatLng? previousLatLng,
            bool? contactsLoaded,
            bool? moveMap,
            Key? mapKey,
            Option<Position> myposition,
            List<EventAndLocationHybrid>? allNotifications,
            List<EventAndLocationHybrid>? allLocationNotifications,
            List<EventAndLocationHybrid>? allEventNotifications,
            int? animateToIndex)?
        showingMap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ShowingMap value) showingMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ShowingMap value)? showingMap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ShowingMap value)? showingMap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  final LocationState _value;
  // ignore: unused_field
  final $Res Function(LocationState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$LocationStateCopyWithImpl<$Res>
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
    return 'LocationState.initial()';
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
    required TResult Function(
            LatLng? myLatLng,
            LatLng? previousLatLng,
            bool? contactsLoaded,
            bool? moveMap,
            Key? mapKey,
            Option<Position> myposition,
            List<EventAndLocationHybrid>? allNotifications,
            List<EventAndLocationHybrid>? allLocationNotifications,
            List<EventAndLocationHybrid>? allEventNotifications,
            int? animateToIndex)
        showingMap,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            LatLng? myLatLng,
            LatLng? previousLatLng,
            bool? contactsLoaded,
            bool? moveMap,
            Key? mapKey,
            Option<Position> myposition,
            List<EventAndLocationHybrid>? allNotifications,
            List<EventAndLocationHybrid>? allLocationNotifications,
            List<EventAndLocationHybrid>? allEventNotifications,
            int? animateToIndex)?
        showingMap,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            LatLng? myLatLng,
            LatLng? previousLatLng,
            bool? contactsLoaded,
            bool? moveMap,
            Key? mapKey,
            Option<Position> myposition,
            List<EventAndLocationHybrid>? allNotifications,
            List<EventAndLocationHybrid>? allLocationNotifications,
            List<EventAndLocationHybrid>? allEventNotifications,
            int? animateToIndex)?
        showingMap,
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
    required TResult Function(_ShowingMap value) showingMap,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ShowingMap value)? showingMap,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ShowingMap value)? showingMap,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LocationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$ShowingMapCopyWith<$Res> {
  factory _$ShowingMapCopyWith(
          _ShowingMap value, $Res Function(_ShowingMap) then) =
      __$ShowingMapCopyWithImpl<$Res>;
  $Res call(
      {LatLng? myLatLng,
      LatLng? previousLatLng,
      bool? contactsLoaded,
      bool? moveMap,
      Key? mapKey,
      Option<Position> myposition,
      List<EventAndLocationHybrid>? allNotifications,
      List<EventAndLocationHybrid>? allLocationNotifications,
      List<EventAndLocationHybrid>? allEventNotifications,
      int? animateToIndex});
}

/// @nodoc
class __$ShowingMapCopyWithImpl<$Res> extends _$LocationStateCopyWithImpl<$Res>
    implements _$ShowingMapCopyWith<$Res> {
  __$ShowingMapCopyWithImpl(
      _ShowingMap _value, $Res Function(_ShowingMap) _then)
      : super(_value, (v) => _then(v as _ShowingMap));

  @override
  _ShowingMap get _value => super._value as _ShowingMap;

  @override
  $Res call({
    Object? myLatLng = freezed,
    Object? previousLatLng = freezed,
    Object? contactsLoaded = freezed,
    Object? moveMap = freezed,
    Object? mapKey = freezed,
    Object? myposition = freezed,
    Object? allNotifications = freezed,
    Object? allLocationNotifications = freezed,
    Object? allEventNotifications = freezed,
    Object? animateToIndex = freezed,
  }) {
    return _then(_ShowingMap(
      myLatLng: myLatLng == freezed
          ? _value.myLatLng
          : myLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      previousLatLng: previousLatLng == freezed
          ? _value.previousLatLng
          : previousLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      contactsLoaded: contactsLoaded == freezed
          ? _value.contactsLoaded
          : contactsLoaded // ignore: cast_nullable_to_non_nullable
              as bool?,
      moveMap: moveMap == freezed
          ? _value.moveMap
          : moveMap // ignore: cast_nullable_to_non_nullable
              as bool?,
      mapKey: mapKey == freezed
          ? _value.mapKey
          : mapKey // ignore: cast_nullable_to_non_nullable
              as Key?,
      myposition: myposition == freezed
          ? _value.myposition
          : myposition // ignore: cast_nullable_to_non_nullable
              as Option<Position>,
      allNotifications: allNotifications == freezed
          ? _value.allNotifications
          : allNotifications // ignore: cast_nullable_to_non_nullable
              as List<EventAndLocationHybrid>?,
      allLocationNotifications: allLocationNotifications == freezed
          ? _value.allLocationNotifications
          : allLocationNotifications // ignore: cast_nullable_to_non_nullable
              as List<EventAndLocationHybrid>?,
      allEventNotifications: allEventNotifications == freezed
          ? _value.allEventNotifications
          : allEventNotifications // ignore: cast_nullable_to_non_nullable
              as List<EventAndLocationHybrid>?,
      animateToIndex: animateToIndex == freezed
          ? _value.animateToIndex
          : animateToIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ShowingMap implements _ShowingMap {
  const _$_ShowingMap(
      {this.myLatLng,
      this.previousLatLng,
      this.contactsLoaded,
      this.moveMap,
      this.mapKey,
      required this.myposition,
      this.allNotifications,
      this.allLocationNotifications,
      this.allEventNotifications,
      this.animateToIndex});

  @override
  final LatLng? myLatLng;
  @override
  final LatLng? previousLatLng;
  @override
  final bool? contactsLoaded;
  @override
  final bool? moveMap;
  @override
  final Key? mapKey;
  @override // so that map doesnt refresh, when we dont want it to
  final Option<Position> myposition;
  @override
  final List<EventAndLocationHybrid>? allNotifications;
  @override
  final List<EventAndLocationHybrid>? allLocationNotifications;
  @override
  final List<EventAndLocationHybrid>? allEventNotifications;
  @override
  final int? animateToIndex;

  @override
  String toString() {
    return 'LocationState.showingMap(myLatLng: $myLatLng, previousLatLng: $previousLatLng, contactsLoaded: $contactsLoaded, moveMap: $moveMap, mapKey: $mapKey, myposition: $myposition, allNotifications: $allNotifications, allLocationNotifications: $allLocationNotifications, allEventNotifications: $allEventNotifications, animateToIndex: $animateToIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShowingMap &&
            const DeepCollectionEquality().equals(other.myLatLng, myLatLng) &&
            const DeepCollectionEquality()
                .equals(other.previousLatLng, previousLatLng) &&
            const DeepCollectionEquality()
                .equals(other.contactsLoaded, contactsLoaded) &&
            const DeepCollectionEquality().equals(other.moveMap, moveMap) &&
            const DeepCollectionEquality().equals(other.mapKey, mapKey) &&
            const DeepCollectionEquality()
                .equals(other.myposition, myposition) &&
            const DeepCollectionEquality()
                .equals(other.allNotifications, allNotifications) &&
            const DeepCollectionEquality().equals(
                other.allLocationNotifications, allLocationNotifications) &&
            const DeepCollectionEquality()
                .equals(other.allEventNotifications, allEventNotifications) &&
            const DeepCollectionEquality()
                .equals(other.animateToIndex, animateToIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(myLatLng),
      const DeepCollectionEquality().hash(previousLatLng),
      const DeepCollectionEquality().hash(contactsLoaded),
      const DeepCollectionEquality().hash(moveMap),
      const DeepCollectionEquality().hash(mapKey),
      const DeepCollectionEquality().hash(myposition),
      const DeepCollectionEquality().hash(allNotifications),
      const DeepCollectionEquality().hash(allLocationNotifications),
      const DeepCollectionEquality().hash(allEventNotifications),
      const DeepCollectionEquality().hash(animateToIndex));

  @JsonKey(ignore: true)
  @override
  _$ShowingMapCopyWith<_ShowingMap> get copyWith =>
      __$ShowingMapCopyWithImpl<_ShowingMap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            LatLng? myLatLng,
            LatLng? previousLatLng,
            bool? contactsLoaded,
            bool? moveMap,
            Key? mapKey,
            Option<Position> myposition,
            List<EventAndLocationHybrid>? allNotifications,
            List<EventAndLocationHybrid>? allLocationNotifications,
            List<EventAndLocationHybrid>? allEventNotifications,
            int? animateToIndex)
        showingMap,
  }) {
    return showingMap(
        myLatLng,
        previousLatLng,
        contactsLoaded,
        moveMap,
        mapKey,
        myposition,
        allNotifications,
        allLocationNotifications,
        allEventNotifications,
        animateToIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            LatLng? myLatLng,
            LatLng? previousLatLng,
            bool? contactsLoaded,
            bool? moveMap,
            Key? mapKey,
            Option<Position> myposition,
            List<EventAndLocationHybrid>? allNotifications,
            List<EventAndLocationHybrid>? allLocationNotifications,
            List<EventAndLocationHybrid>? allEventNotifications,
            int? animateToIndex)?
        showingMap,
  }) {
    return showingMap?.call(
        myLatLng,
        previousLatLng,
        contactsLoaded,
        moveMap,
        mapKey,
        myposition,
        allNotifications,
        allLocationNotifications,
        allEventNotifications,
        animateToIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            LatLng? myLatLng,
            LatLng? previousLatLng,
            bool? contactsLoaded,
            bool? moveMap,
            Key? mapKey,
            Option<Position> myposition,
            List<EventAndLocationHybrid>? allNotifications,
            List<EventAndLocationHybrid>? allLocationNotifications,
            List<EventAndLocationHybrid>? allEventNotifications,
            int? animateToIndex)?
        showingMap,
    required TResult orElse(),
  }) {
    if (showingMap != null) {
      return showingMap(
          myLatLng,
          previousLatLng,
          contactsLoaded,
          moveMap,
          mapKey,
          myposition,
          allNotifications,
          allLocationNotifications,
          allEventNotifications,
          animateToIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ShowingMap value) showingMap,
  }) {
    return showingMap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ShowingMap value)? showingMap,
  }) {
    return showingMap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ShowingMap value)? showingMap,
    required TResult orElse(),
  }) {
    if (showingMap != null) {
      return showingMap(this);
    }
    return orElse();
  }
}

abstract class _ShowingMap implements LocationState {
  const factory _ShowingMap(
      {LatLng? myLatLng,
      LatLng? previousLatLng,
      bool? contactsLoaded,
      bool? moveMap,
      Key? mapKey,
      required Option<Position> myposition,
      List<EventAndLocationHybrid>? allNotifications,
      List<EventAndLocationHybrid>? allLocationNotifications,
      List<EventAndLocationHybrid>? allEventNotifications,
      int? animateToIndex}) = _$_ShowingMap;

  LatLng? get myLatLng;
  LatLng? get previousLatLng;
  bool? get contactsLoaded;
  bool? get moveMap;
  Key? get mapKey; // so that map doesnt refresh, when we dont want it to
  Option<Position> get myposition;
  List<EventAndLocationHybrid>? get allNotifications;
  List<EventAndLocationHybrid>? get allLocationNotifications;
  List<EventAndLocationHybrid>? get allEventNotifications;
  int? get animateToIndex;
  @JsonKey(ignore: true)
  _$ShowingMapCopyWith<_ShowingMap> get copyWith =>
      throw _privateConstructorUsedError;
}
