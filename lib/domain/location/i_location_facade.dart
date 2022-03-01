import 'dart:async';

import 'package:atsign_location_app/domain/location/models/event_and_location.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

abstract class ILocationFacade {
  bool? get contactsLoaded;
  bool? get moveMap;
  LatLng? get previousLatLng;
  Key? get mapKey;
  List<EventAndLocationHybrid>? get allEventNotifications;
  List<EventAndLocationHybrid>? get allLocationNotifications;
  List<EventAndLocationHybrid>? get allNotifications;
  int? get animateToIndex;

  Future<Unit> initializaLocationServices(
    GlobalKey<NavigatorState> navKey,
  );

  Stream<Option<Position>> getMyLocationStatus();
}
