part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.started(
    GlobalKey<NavigatorState> navKey,
  ) = _Started;
  const factory LocationEvent.locationServicesInitialized(
    Option<Position> myPosition,
  ) = _LocationServicesInitialized;
  const factory LocationEvent.locationDataReceived(
    Option<Position> myPosition,
  ) = _LocationDataReceived;
}
