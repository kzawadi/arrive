import 'dart:async';

import 'package:atsign_location_app/domain/location/i_location_facade.dart';
import 'package:atsign_location_app/domain/location/models/event_and_location.dart';
import 'package:atsign_location_app/domain/location/use_cases/init_location_services_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
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
  LocationBloc(
    this._initLocationServicesUseCase,
    this._iLocationFacade,
  ) : super(const LocationState.initial()) {
    on<LocationEvent>(_locationHandler, transformer: sequential());
  }

  final InitLocationServicesUseCase _initLocationServicesUseCase;
  final ILocationFacade _iLocationFacade;
  StreamSubscription<Option<Position>>? _myPositionStreamSubscription;

  Future _locationHandler(
    LocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    await event.when(
      started: (navKey) async {
        await _initLocationServicesUseCase(navKey).then(
          (value) async {
            await _myPositionStreamSubscription?.cancel();
            _myPositionStreamSubscription =
                _iLocationFacade.getMyLocationStatus().listen(
                      (myPosition) => add(
                        LocationEvent.locationServicesInitialized(
                          myPosition,
                        ),
                      ),
                    );
          },
          // ignore: invalid_return_type_for_catch_error
        ).catchError(onError);
      },
      locationServicesInitialized: (myPosition) async {
        emit(
          LocationState.showingMap(
            contactsLoaded: _iLocationFacade.contactsLoaded,
            moveMap: _iLocationFacade.moveMap,
            previousLatLng: _iLocationFacade.previousLatLng,
            myposition: myPosition!,
            mapKey: _iLocationFacade.mapKey,
            allEventNotifications: _iLocationFacade.allEventNotifications,
            allLocationNotifications: _iLocationFacade.allLocationNotifications,
            allNotifications: _iLocationFacade.allNotifications,
            animateToIndex: _iLocationFacade.animateToIndex,
          ),
        );
      },
      locationDataReceived: (myPosition) {},
    );
  }
}
