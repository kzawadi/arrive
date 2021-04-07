import 'dart:async';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_commons/at_commons.dart';
import 'package:atsign_location_app/common_components/dialog_box/location_prompt_dialog.dart';
import 'package:atsign_location_app/plugins/at_events_flutter/common_components/custom_toast.dart';
import 'package:atsign_location_app/plugins/at_location_flutter/location_modal/location_notification.dart';
import 'package:atsign_location_app/plugins/at_location_flutter/service/my_location.dart';
import 'package:atsign_location_app/services/backend_service.dart';
import 'package:atsign_location_app/services/location_notification_listener.dart';
import 'package:atsign_location_app/services/nav_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';

class SendLocationNotification {
  SendLocationNotification._();
  static SendLocationNotification _instance = SendLocationNotification._();
  factory SendLocationNotification() => _instance;
  Timer timer;
  List<LocationNotificationModel> receivingAtsigns;
  AtClientImpl atClient;
  StreamSubscription<Position> positionStream;
  init(List<LocationNotificationModel> atsigns, AtClientImpl newAtClient) {
    if ((timer != null) && (timer.isActive)) timer.cancel();

    receivingAtsigns = [...atsigns];
    atClient = newAtClient;
    print('receivingAtsigns length - ${receivingAtsigns.length}');

    if (positionStream != null) positionStream.cancel();
    updateMyLocation();
  }

  addMember(
      {LocationNotificationModel notification,
      List<LocationNotificationModel> notificationList}) async {
    // if already added
    if (notification != null &&
        receivingAtsigns
                .indexWhere((element) => element.key == notification.key) >
            -1) {
      return;
    }

    // checking if location key is already present in receiving atsigns length
    if (notificationList != null &&
        notificationList.isNotEmpty &&
        receivingAtsigns.indexWhere(
                (element) => element.key == notificationList[0].key) >
            -1) {
      return;
    }

    LatLng myLocation = await getMyLocation();

    if (myLocation != null) {
      // send
      bool isMasterSwitchOn =
          await LocationNotificationListener().getShareLocation();

      if (!isMasterSwitchOn) {
        await locationPromptDialog();
        isMasterSwitchOn =
            await LocationNotificationListener().getShareLocation();
      }

      if (isMasterSwitchOn) {
        if (notificationList == null) {
          await prepareLocationDataAndSend(notification, myLocation);
        } else {
          await Future.forEach(notificationList, (element) async {
            await prepareLocationDataAndSend(element, myLocation);
          });
        }
      }
    } else {
      CustomToast().show(
          'Location permission not granted', NavService.navKey.currentContext);
    }

    // add
    if (notificationList == null) {
      receivingAtsigns.add(notification);
    } else {
      receivingAtsigns = [...receivingAtsigns, ...notificationList];
    }
    print('after adding receivingAtsigns length ${receivingAtsigns.length}');
  }

  removeMember(String key) async {
    LocationNotificationModel locationNotificationModel;
    if (receivingAtsigns == null || receivingAtsigns.isEmpty) {
      return;
    }
    receivingAtsigns.removeWhere((element) {
      if (key.contains(element.key)) locationNotificationModel = element;
      return key.contains(element.key);
    });
    if (locationNotificationModel != null) sendNull(locationNotificationModel);

    print('after deleting receivingAtsigns length ${receivingAtsigns.length}');
  }

  updateMyLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (((permission == LocationPermission.always) ||
        (permission == LocationPermission.whileInUse))) {
      positionStream = Geolocator.getPositionStream(distanceFilter: 100)
          .listen((myLocation) async {
        bool isMasterSwitchOn =
            await LocationNotificationListener().getShareLocation();
        if (isMasterSwitchOn) {
          receivingAtsigns.forEach((notification) async {
            print(
                'sending to receivingAtsigns: ${notification.atsignCreator}, ${notification.receiver}');
            await prepareLocationDataAndSend(notification,
                LatLng(myLocation.latitude, myLocation.longitude));
          });
        }
      });
    }
  }

  prepareLocationDataAndSend(
      LocationNotificationModel notification, LatLng myLocation) async {
    bool isSend = false;

    if (notification.to == null)
      isSend = true;
    else if ((DateTime.now().difference(notification.from) >
            Duration(seconds: 0)) &&
        (notification.to.difference(DateTime.now()) > Duration(seconds: 0)))
      isSend = true;
    if (isSend) {
      notification.lat = myLocation.latitude;
      notification.long = myLocation.longitude;
      String atkeyMicrosecondId = notification.key.split('-')[1].split('@')[0];
      AtKey atKey = newAtKey(
          5000, "locationnotify-$atkeyMicrosecondId", notification.receiver);
      try {
        await atClient.put(
            atKey,
            LocationNotificationModel.convertLocationNotificationToJson(
                notification));
      } catch (e) {
        print('error in sending location: $e');
      }
    }
  }

  sendNull(LocationNotificationModel locationNotificationModel) async {
    String atkeyMicrosecondId =
        locationNotificationModel.key.split('-')[1].split('@')[0];
    AtKey atKey = newAtKey(5000, "locationnotify-$atkeyMicrosecondId",
        locationNotificationModel.receiver);
    var result = await atClient.delete(atKey);
    print('$atKey delete operation $result');
  }

  deleteAllLocationKey() async {
    List<String> response = await atClient.getKeys(
      regex: 'locationnotify',
    );
    response.forEach((key) async {
      if (!'@$key'.contains('cached')) {
        // the keys i have created
        AtKey atKey = BackendService.getInstance().getAtKey(key);
        var result = await atClient.delete(atKey);
        print('$key is deleted ? $result');
      }
    });
  }

  AtKey newAtKey(int ttr, String key, String sharedWith) {
    AtKey atKey = AtKey()
      ..metadata = Metadata()
      ..metadata.ttr = ttr
      ..metadata.ccd = true
      ..key = key
      ..sharedWith = sharedWith
      ..sharedBy = atClient.currentAtSign;
    return atKey;
  }
}

enum ATSIGNS { COLIN, ASHISH, BOB }
