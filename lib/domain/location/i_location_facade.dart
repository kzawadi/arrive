import 'dart:async';

import 'package:at_location_flutter/at_location_flutter.dart';
import 'package:atsign_location_app/domain/location/models/event_and_location.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

abstract class ILocationFacade {
  MapController get mapController;
  bool? get contactsLoaded;
  bool? get moveMap;
  LatLng? get previousLatLng;
  Key? get mapKey;
  List<EventAndLocationHybrid>? get allEventNotifications;
  List<EventAndLocationHybrid>? get allLocationNotifications;
  List<EventAndLocationHybrid>? get allNotifications;
  int? get animateToIndex;

  void getLocationStatus();
  Future<Unit> initLocationServices();
  Future<void> getMyLocations();

  Future<Unit> init(
    GlobalKey<NavigatorState> navKey,
  );

  Stream<Option<Position>> getMyLocationStatus();
}
