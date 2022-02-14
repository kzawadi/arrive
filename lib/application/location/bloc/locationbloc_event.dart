part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.started(
    GlobalKey<NavigatorState> navKey,
  ) = _Started;
  const factory LocationEvent.locationServicesInitialized() =
      _LocationServicesInitialized;
}
