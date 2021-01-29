import 'package:atsign_events/models/event_notification.dart';
import 'package:atsign_location/atsign_location_plugin.dart';
import 'package:atsign_location/location_modal/location_notification.dart';

import 'package:atsign_location_app/services/backend_service.dart';
import 'package:atsign_location_app/services/client_sdk_service.dart';
import 'package:atsign_location_app/services/location_notification_listener.dart';
import 'package:atsign_location_app/services/location_sharing_service.dart';
import 'package:atsign_location_app/services/nav_service.dart';
import 'package:atsign_location_app/services/request_location_service.dart';
import 'package:flutter/material.dart';
import 'package:atsign_location_app/view_models/event_provider.dart';
import 'package:atsign_events/models/hybrid_notifiation_model.dart';

class HomeEventService {
  HomeEventService._();
  static HomeEventService _instance = HomeEventService._();
  factory HomeEventService() => _instance;

  List<HybridNotificationModel> allEvents = [];
  setAllEventsList(List<HybridNotificationModel> events) {
    allEvents = events;
  }

  get getAllEvents => allEvents;

  onLocationModelTap(LocationNotificationModel locationNotificationModel) {
    String currentAtsign = ClientSdkService.getInstance()
        .atClientServiceInstance
        .atClient
        .currentAtSign;

    if (locationNotificationModel.key.contains('sharelocation'))
      locationNotificationModel.atsignCreator != currentAtsign
          ? (locationNotificationModel.isAccepted
              ? navigatorPushToMap(locationNotificationModel)
              : BackendService.getInstance().showMyDialog(
                  locationNotificationModel.atsignCreator,
                  locationData: locationNotificationModel))
          : navigatorPushToMap(locationNotificationModel);
    else if (locationNotificationModel.key.contains('requestlocation'))
      locationNotificationModel.atsignCreator == currentAtsign
          ? (locationNotificationModel.isAccepted
              ? navigatorPushToMap(locationNotificationModel)
              : BackendService.getInstance().showMyDialog(
                  locationNotificationModel.atsignCreator,
                  locationData: locationNotificationModel))
          : navigatorPushToMap(locationNotificationModel);
  }

  onEventModelTap(
      EventNotificationModel eventNotificationModel, EventProvider provider) {
    // print('event tapped:${eventNotificationModel.isSharing}');
    if (isActionRequired(eventNotificationModel) &&
        !eventNotificationModel.isCancelled) {
      return BackendService.getInstance().showMyDialog(
          eventNotificationModel.atsignCreator,
          eventData: eventNotificationModel);
    }

    Navigator.push(
      NavService.navKey.currentContext,
      MaterialPageRoute(
        builder: (context) => AtsignLocationPlugin(
            ClientSdkService.getInstance().atClientServiceInstance.atClient,
            allUsersList: LocationNotificationListener().allUsersList,
            onEventCancel: () {
          provider.cancelEvent(eventNotificationModel);
        }, onEventExit: (
                {bool isExited,
                bool isSharing,
                ATKEY_TYPE_ENUM keyType,
                EventNotificationModel eventData}) {
          provider.actionOnEvent(
            eventNotificationModel,
            keyType,
            isExited: isExited,
            isSharing: isSharing,
          );
        }, onEventUpdate: (EventNotificationModel eventData) {
          provider.mapUpdatedEventDataToWidget(eventData);
        }, eventListenerKeyword: eventNotificationModel),
      ),
    );
  }

  navigatorPushToMap(LocationNotificationModel locationNotificationModel) {
    Navigator.push(
      NavService.navKey.currentContext,
      MaterialPageRoute(
        builder: (context) => AtsignLocationPlugin(
          ClientSdkService.getInstance().atClientServiceInstance.atClient,
          allUsersList: LocationNotificationListener().allUsersList,
          userListenerKeyword: locationNotificationModel,
          onShareToggle: locationNotificationModel.key.contains("sharelocation")
              ? LocationSharingService().updateWithShareLocationAcknowledge
              : RequestLocationService().requestLocationAcknowledgment,
          onRemove: locationNotificationModel.key.contains("sharelocation")
              ? (locationNotificationModel) => LocationSharingService()
                  .removePerson(locationNotificationModel)
              : (locationNotificationModel) => RequestLocationService()
                  .removePerson(locationNotificationModel),
        ),
      ),
    );
  }
}

bool isActionRequired(EventNotificationModel event) {
  if (event.isCancelled) return true;

  bool isRequired = true;
  String currentAtsign = ClientSdkService.getInstance()
      .atClientServiceInstance
      .atClient
      .currentAtSign;

  if (event.group.members.length < 1) return true;

  event.group.members.forEach((member) {
    if ((member.tags['isAccepted'] != null &&
            member.tags['isAccepted'] == true) &&
        member.tags['isExited'] == false &&
        member.atSign == currentAtsign) {
      isRequired = false;
    }
  });

  if (event.atsignCreator == currentAtsign) isRequired = false;

  return isRequired;
}

String getActionString(EventNotificationModel event) {
  if (event.isCancelled) return 'Cancelled';
  String label = 'Action required';
  String currentAtsign = ClientSdkService.getInstance()
      .atClientServiceInstance
      .atClient
      .currentAtSign;

  if (event.group.members.length < 1) return '';

  event.group.members.forEach((member) {
    if (member.tags['isExited'] != null &&
        member.tags['isExited'] == true &&
        member.atSign == currentAtsign) {
      label = 'Request declined';
    }
  });

  return label;
}

getSubTitle(HybridNotificationModel hybridNotificationModel) {
  if (hybridNotificationModel.notificationType == NotificationType.Event) {
    return hybridNotificationModel.eventNotificationModel.event != null
        ? hybridNotificationModel.eventNotificationModel.event.date != null
            ? 'event on ${dateToString(hybridNotificationModel.eventNotificationModel.event.date)}'
            : ''
        : '';
  } else if (hybridNotificationModel.notificationType ==
      NotificationType.Location) {
    if (hybridNotificationModel.locationNotificationModel.key
        .contains('sharelocation'))
      return hybridNotificationModel.locationNotificationModel.atsignCreator ==
              ClientSdkService.getInstance()
                  .atClientServiceInstance
                  .atClient
                  .currentAtSign
          ? 'Can see my location'
          : 'Sharing his location';
    else
      return hybridNotificationModel.locationNotificationModel.isAccepted
          ? hybridNotificationModel.locationNotificationModel.atsignCreator ==
                  ClientSdkService.getInstance()
                      .atClientServiceInstance
                      .atClient
                      .currentAtSign
              ? 'Shring my location'
              : 'Sharing his location'
          : hybridNotificationModel.locationNotificationModel.atsignCreator ==
                  ClientSdkService.getInstance()
                      .atClientServiceInstance
                      .atClient
                      .currentAtSign
              ? 'Requested Location received'
              : 'Requested Location sent';
  }
}

getSemiTitle(HybridNotificationModel hybridNotificationModel) {
  if (hybridNotificationModel.notificationType == NotificationType.Event) {
    return hybridNotificationModel.eventNotificationModel.group != null
        ? (isActionRequired(hybridNotificationModel.eventNotificationModel))
            ? getActionString(hybridNotificationModel.eventNotificationModel)
            : null
        : 'Action required';
  } else if (hybridNotificationModel.notificationType ==
      NotificationType.Location) {
    if (hybridNotificationModel.locationNotificationModel.key
        .contains('sharelocation'))
      return hybridNotificationModel.locationNotificationModel.atsignCreator !=
              ClientSdkService.getInstance()
                  .atClientServiceInstance
                  .atClient
                  .currentAtSign
          ? (hybridNotificationModel.locationNotificationModel.isAccepted
              ? ''
              : hybridNotificationModel.locationNotificationModel.isExited
                  ? 'Received Share location request rejected'
                  : 'Action required')
          : (hybridNotificationModel.locationNotificationModel.isAccepted
              ? ''
              : hybridNotificationModel.locationNotificationModel.isExited
                  ? 'Sent Share location request rejected'
                  : 'Awaiting response');
    else
      return hybridNotificationModel.locationNotificationModel.atsignCreator ==
              ClientSdkService.getInstance()
                  .atClientServiceInstance
                  .atClient
                  .currentAtSign
          ? (!hybridNotificationModel.locationNotificationModel.isExited
              ? (hybridNotificationModel.locationNotificationModel.isAccepted
                  ? ''
                  : 'Action required')
              : 'Request rejected')
          : (!hybridNotificationModel.locationNotificationModel.isExited
              ? (hybridNotificationModel.locationNotificationModel.isAccepted
                  ? ''
                  : 'Awaiting response')
              : 'Request rejected');
  }
}

getTitle(HybridNotificationModel hybridNotificationModel) {
  if (hybridNotificationModel.notificationType == NotificationType.Event) {
    return hybridNotificationModel.eventNotificationModel.title;
  } else if (hybridNotificationModel.notificationType ==
      NotificationType.Location) {
    if (hybridNotificationModel.locationNotificationModel.key
        .contains('sharelocation'))
      return hybridNotificationModel.locationNotificationModel.atsignCreator ==
              ClientSdkService.getInstance()
                  .atClientServiceInstance
                  .atClient
                  .currentAtSign
          ? hybridNotificationModel.locationNotificationModel.receiver
          : hybridNotificationModel.locationNotificationModel.atsignCreator;
    else
      return hybridNotificationModel.locationNotificationModel.atsignCreator ==
              ClientSdkService.getInstance()
                  .atClientServiceInstance
                  .atClient
                  .currentAtSign
          ? hybridNotificationModel.locationNotificationModel.receiver
          : hybridNotificationModel.locationNotificationModel.atsignCreator;
  }
}
