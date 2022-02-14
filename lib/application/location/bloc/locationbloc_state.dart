part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.showingMap({
    LatLng? myLatLng,
    LatLng? previousLatLng,
    bool? contactsLoaded,
    bool? moveMap,
    Key? mapKey, // so that map doesnt refresh, when we dont want it to
    MapController? mapController,
    StreamSubscription<Position>? positionStream,
    List<EventAndLocationHybrid>? allNotifications,
    List<EventAndLocationHybrid>? allLocationNotifications,
    List<EventAndLocationHybrid>? allEventNotifications,
    int? animateToIndex,
  }) = _ShowingMap;
}
