import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_commons/at_commons.dart';
import 'package:at_contacts_group_flutter/utils/init_group_service.dart';
import 'package:at_contacts_group_flutter/widgets/custom_toast.dart';
import 'package:at_events_flutter/at_events_flutter.dart';
import 'package:at_location_flutter/at_location_flutter.dart';
import 'package:at_location_flutter/common_components/location_prompt_dialog.dart';
import 'package:at_location_flutter/location_modal/key_location_model.dart';
import 'package:at_onboarding_flutter/utils/app_constants.dart';
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
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: ILocationFacade)
class LocationFacade implements ILocationFacade {
  final atContactInitializationUseCase =
      getIt<AtContactInitializationUseCase>();

  bool isSharing = false;
  bool isGettingLoadedFirstTime = true;
  bool locationSharingSwitchProcessing = false;
  // ignore: non_constant_identifier_names
  String GET_ALL_NOTIFICATIONS = 'get_all_notifications';
  @override
  int animateToIndex = -1;

  @override
  List<EventAndLocationHybrid> allNotifications = [];
  @override
  List<EventAndLocationHybrid> allLocationNotifications = [];
  @override
  List<EventAndLocationHybrid> allEventNotifications = [];
  @override
  Key mapKey =
      UniqueKey(); // so that map doesnt refresh, when we dont want it to

  LatLng? myLatLng;
  @override
  LatLng? previousLatLng;
  @override
  bool contactsLoaded = true;
  @override
  bool? moveMap;

  BehaviorSubject<Position?>? myPosition;
  @override
  late BehaviorSubject<List<EventAndLocationHybrid>>
      allEventNotificationStream =
      BehaviorSubject<List<EventAndLocationHybrid>>();
  @override
  late BehaviorSubject<List<EventAndLocationHybrid>>
      allLocalNotificationStream =
      BehaviorSubject<List<EventAndLocationHybrid>>();

  String locationSharingKey =
      'issharing-${AtClientManager.getInstance().atClient.getCurrentAtSign()!.replaceAll('@', '')}';

  Future<void> initializePlugins() async {
    await atContactInitializationUseCase.call();
  }

  @override
  Future<Unit> init(
    GlobalKey<NavigatorState> navKey,
  ) async {
    // if (isGettingLoadedFirstTime) {
    //   setStatus(GET_ALL_NOTIFICATIONS, Status.Loading);
    //   isGettingLoadedFirstTime = false;
    // }
    // allNotifications = [];

    allLocationNotifications = [];
    allEventNotifications = [];

    await initializeLocationService(
      navKey,
      mapKey: Constants.mapKey,
      apiKey: Constants.appApiKey,
      showDialogBox: true,
      streamAlternative: updateLocation,
      isEventInUse: true,
    ).then(
      (_) async {
        await initialiseEventService(
          navKey,
          mapKey: Constants.mapKey,
          apiKey: Constants.appApiKey,
          rootDomain: Constants.rootDomain,
          streamAlternative: updateEvents,
          initLocation: false,
        ).then(
          (_) async {
            await initialiseLocationSharing(
              navKey,
            ).then((_) async {
              initializeGroupService(rootDomain: Constants.rootDomain);
            });
          },
        );
      },
    );

    SendLocationNotification().setLocationPrompt(() async {
      await locationPromptDialog(
        isShareLocationData: false,
        isRequestLocationData: false,
      );
    });

    return unit;
  }

  Stream<List<EventAndLocationHybrid>> updateLocation(
      List<KeyLocationModel> list) async* {
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
    allLocalNotificationStream.add(allLocationNotifications);
    yield* allLocalNotificationStream.stream;

    // setStatus(GET_ALL_NOTIFICATIONS, Status.Done);
  }

  Future<void> updateEvents(
    List<EventKeyLocationModel> list,
  ) async {
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
    allEventNotificationStream.add(allEventNotifications);
    allEventNotificationStream.stream;
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
        await AtClientManager.getInstance().atClient.get(atKey).onError(
      (e, s) async {
        print('error in get getShareLocation $e');

        /// create
        /// if key already exists, then make false for safer side
        /// else make it true, as a default value
        await updateLocationSharingKey(!alreadyExists, navKey);
        return AtClientManager.getInstance().atClient.get(atKey);
      },
    );
    //     .catchError(
    //   // ignore: invalid_return_type_for_catch_error
    //   (dynamic e) async {
    //     print('error in get getShareLocation $e');

    //     /// create
    //     /// if key already exists, then make false for safer side
    //     /// else make it true, as a default value
    //     await updateLocationSharingKey(!alreadyExists, navKey);
    //   },
    // );

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

      return result;
    } catch (e) {
      CustomToast().show(
        'Error in switching location sharing $e ',
        navKey.currentContext!,
      );
      return false;
    }
  }

  @override
  Stream<Option<Position>> getMyLocationStatus() async* {
    yield* _getMyLocation();
  }

  Stream<Option<Position>> _getMyLocation() async* {
    final newMyLatLng = await getMyLocation();
    if (newMyLatLng != null) {
      myLatLng = newMyLatLng;
    }

    final permission = await Geolocator.checkPermission();

    if ((permission == LocationPermission.always) ||
        (permission == LocationPermission.whileInUse)) {
      if (myPosition != null) {
        await myPosition!.close();
      }
      final c = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(distanceFilter: 2),
      );

      final v = c.asyncMap(optionOf);
      yield* v;
    }
  }
}
