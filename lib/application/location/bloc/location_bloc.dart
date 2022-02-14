import 'dart:async';

import 'package:at_location_flutter/at_location_flutter.dart';
import 'package:atsign_location_app/domain/location/models/event_and_location.dart';
import 'package:atsign_location_app/domain/location/use_cases/init_location_services_use_case.dart';
import 'package:atsign_location_app/infrastructure/location/location_facade.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

part 'locationbloc_event.dart';
part 'locationbloc_state.dart';
part 'location_bloc.freezed.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(this._initLocationServicesUseCase, this._locationFacade)
      : super(const LocationState.initial()) {
    on<LocationEvent>(_locationHandler);
  }

  final InitLocationServicesUseCase _initLocationServicesUseCase;
  final LocationFacade _locationFacade;

  Future _locationHandler(
    LocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    await event.when(
      started: (navKey) async {
        emit(const LocationState.initial());
        await _initLocationServicesUseCase(navKey);
      },
      locationServicesInitialized: () async {
        emit(
          LocationState.showingMap(
            myLatLng: _locationFacade.myLatLng,
            contactsLoaded: _locationFacade.contactsLoaded,
            mapController: _locationFacade.mapController,
            moveMap: _locationFacade.moveMap,
            previousLatLng: _locationFacade.previousLatLng,
            positionStream: _locationFacade.positionStream,
            mapKey: _locationFacade.mapKey,
            allEventNotifications: _locationFacade.allEventNotifications,
            allLocationNotifications: _locationFacade.allLocationNotifications,
            allNotifications: _locationFacade.allNotifications,
            animateToIndex: _locationFacade.animateToIndex,
          ),
        );
      },
    );
  }
}
