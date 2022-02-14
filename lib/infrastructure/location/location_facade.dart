import 'dart:async';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_commons/at_commons.dart';
import 'package:at_contacts_group_flutter/widgets/custom_toast.dart';
import 'package:at_events_flutter/at_events_flutter.dart';
import 'package:at_location_flutter/at_location_flutter.dart';
import 'package:at_location_flutter/common_components/location_prompt_dialog.dart';
import 'package:at_location_flutter/location_modal/key_location_model.dart';
import 'package:atsign_location_app/domain/contacts/use_cases/at_contacts_use_cases.dart';
import 'package:atsign_location_app/domain/location/i_location_facade.dart';
import 'package:atsign_location_app/domain/location/models/event_and_location.dart';
import 'package:atsign_location_app/injections.dart';
import 'package:atsign_location_app/shared/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

// @LazySingleton(as: ILocationFacade)
@injectable
class LocationFacade {
  final atContactInitializationUseCase =
      getIt<AtContactInitializationUseCase>();

  bool isSharing = false;
  bool isGettingLoadedFirstTime = true;
  bool locationSharingSwitchProcessing = false;
  String GET_ALL_NOTIFICATIONS = 'get_all_notifications';
  int animateToIndex = -1;

  List<EventAndLocationHybrid> allNotifications = [];
  List<EventAndLocationHybrid> allLocationNotifications = [];
  List<EventAndLocationHybrid> allEventNotifications = [];
  Key mapKey =
      UniqueKey(); // so that map doesnt refresh, when we dont want it to

  LatLng? myLatLng;
  LatLng? previousLatLng;
  bool contactsLoaded = true;
  bool? moveMap;
  MapController? mapController; //MapController mapController = MapController();

  StreamSubscription<Position>? positionStream;
  // final GlobalKey<NavigatorState> navKey = GlobalKey();

  String locationSharingKey =
      'issharing-${AtClientManager.getInstance().atClient.getCurrentAtSign()!.replaceAll('@', '')}';

  @override
  void getLocationStatus() {
    // TODO: implement getLocationStatus
  }

  @override
  Future<void> getMyLocations() {
    // TODO: implement getMyLocation
    throw UnimplementedError();
  }

  @override
  Future<Unit> initLocationServices() async {
    // await initializeLocationService(
    //   navKey,
    //   mapKey: 'xxxx',
    //   apiKey: 'xxxx',
    //   showDialogBox: true,
    //   streamAlternative: (__) {},
    //   isEventInUse: true,
    // );
    return unit;
  }

  Future<void> initializePlugins() async {
    await atContactInitializationUseCase.call();
  }

  @override
  Future<Unit> init(
    // AtClientManager atClientManager,
    // String activeAtSign,
    GlobalKey<NavigatorState> navKey,
  ) async {
    // if (isGettingLoadedFirstTime) {
    //   setStatus(GET_ALL_NOTIFICATIONS, Status.Loading);
    //   isGettingLoadedFirstTime = false;
    // }
    // allNotifications = [];
    allLocationNotifications = [];
    allEventNotifications = [];

    await initialiseLocationSharing(navKey);
    await initializePlugins();

    await initializeLocationService(
      navKey,
      mapKey: Constants.mapKey,
      apiKey: Constants.appApiKey,
      showDialogBox: true,
      streamAlternative: updateLocation,
      isEventInUse: true,
    );

    // await initialiseEventService(
    //   navKey,
    //   mapKey: Constants.mapKey,
    //   apiKey: Constants.appApiKey,
    //   rootDomain: Constants.rootDomain,
    //   streamAlternative: updateEvents,
    //   initLocation: false,
    // );

    SendLocationNotification().setLocationPrompt(() async {
      await locationPromptDialog(
        isShareLocationData: false,
        isRequestLocationData: false,
      );
    });

    await _getLocationStatus();

    return unit;
  }

  Future<void> updateLocation(List<KeyLocationModel> list) async {
    if (allLocationNotifications.length < list.length) {
      animateToIndex = 1; // Locations is index 1 in home screen
    } else {
      animateToIndex = -1; // don't animate
    }

    allLocationNotifications = list
        .map(
          (e) => EventAndLocationHybrid(
            NotificationModelType.locationModel,
            locationKeyModel: e,
          ),
        )
        .toList();
    // setStatus(GET_ALL_NOTIFICATIONS, Status.Done);
  }

  Future<void> updateEvents(List<EventKeyLocationModel> list) async {
    if (allEventNotifications.length < list.length) {
      animateToIndex = 0; // Events is index 0 in home screen
    } else {
      animateToIndex = -1; // don't animate
    }

    allEventNotifications = list
        .map(
          (e) => EventAndLocationHybrid(
            NotificationModelType.eventModel,
            eventKeyModel: e,
          ),
        )
        .toList();
    // setStatus(GET_ALL_NOTIFICATIONS, Status.Done);
  }

  Future<void> initialiseLocationSharing(
    GlobalKey<NavigatorState> navKey,
  ) async {
    isSharing = await getShareLocation(navKey);
    SendLocationNotification().setMasterSwitchState(isSharing);
    // EventLocationShare().setMasterSwitchState(isSharing);
  }

  Future<bool> getShareLocation(
    GlobalKey<NavigatorState> navKey,
  ) async {
    final allLocationSharingKey =
        await AtClientManager.getInstance().atClient.getAtKeys(
              regex: locationSharingKey,
            );

    final alreadyExists = allLocationSharingKey.isNotEmpty;

    final atKey = AtKey()
      ..metadata = Metadata()
      ..metadata!.ttr = -1
      ..metadata!.ccd = true
      ..key = locationSharingKey;
    final value =
        await AtClientManager.getInstance().atClient.get(atKey).catchError(
            // ignore: invalid_return_type_for_catch_error
            (dynamic e) async {
      print('error in get getShareLocation $e');

      /// create
      /// if key already exists, then make false for safer side
      /// else make it true, as a default value
      await updateLocationSharingKey(!alreadyExists, navKey);
    });

    // ignore: avoid_bool_literals_in_conditional_expressions
    return (value.value == 'true') ? true : false;
  }

  Future<bool> updateLocationSharingKey(
    bool value,
    GlobalKey<NavigatorState> navKey,
  ) async {
    try {
      final atKey = AtKey()
        ..metadata = Metadata()
        ..metadata!.ttr = -1
        ..metadata!.ccd = true
        ..key = locationSharingKey;

      final result = await AtClientManager.getInstance()
          .atClient
          .put(atKey, value.toString());

      if (result == true) {
        isSharing = value;
        SendLocationNotification().setMasterSwitchState(value);
      }

      // notifyListeners();

      return result;
    } catch (e) {
      CustomToast().show(
        'Error in switching location sharing $e ',
        navKey.currentContext!,
      );
      return false;
    }
  }

  Future<void> _getLocationStatus() async {
    await _getMyLocation();

    Geolocator.getServiceStatusStream().listen((event) {
      mapKey = UniqueKey();
      if (event == ServiceStatus.disabled) {
        // setState(() {
        myLatLng = null;
        // });
      } else if (event == ServiceStatus.enabled) {
        _getMyLocation();
      }
    });
  }

  Future<void> _getMyLocation() async {
    final newMyLatLng = await getMyLocation();

    if (newMyLatLng != null) {
      // setState(() {
      myLatLng = newMyLatLng;
      // });
    }

    final permission = await Geolocator.checkPermission();

    if ((permission == LocationPermission.always) ||
        (permission == LocationPermission.whileInUse)) {
      if (positionStream != null) {
        await positionStream!.cancel();
      }

      positionStream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(distanceFilter: 2),
      ).listen(
        (locationStream) async {
          // if (mounted) {
          //   setState(() {
          myLatLng = LatLng(locationStream.latitude, locationStream.longitude);
        },
      );
      // }

    }
  }

  void shouldMoveMap() {
    if (myLatLng != null) {
      if (moveMap == null) {
        moveMap = true;
      } else {
        moveMap = false;
      }
    }

    previousLatLng = myLatLng;
  }

  void zoomOutFn() {
    if (mapController != null) {
      mapController!.move(myLatLng, 8);
    }
  }

  // @override
  // Key? mapKey;
}

class NavService {
  static GlobalKey<NavigatorState> navKey = GlobalKey();
}
