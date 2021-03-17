import 'dart:async';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_commons/at_commons.dart';
import 'package:atsign_location_app/plugins/at_events_flutter/common_components/custom_toast.dart';
import 'package:atsign_location_app/plugins/at_location_flutter/location_modal/location_notification.dart';
import 'package:atsign_location_app/plugins/at_location_flutter/service/my_location.dart';
import 'package:atsign_location_app/routes/route_names.dart';
import 'package:atsign_location_app/routes/routes.dart';
import 'package:atsign_location_app/services/backend_service.dart';
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

    receivingAtsigns = atsigns;
    atClient = newAtClient;
    //Location().changeSettings(interval: 10);
    print('receivingAtsigns length - ${receivingAtsigns.length}');

    if (positionStream != null) positionStream.cancel();
    updateMyLocation();
  }

  // addMember(String atsign) {
  //   // send
  //   // add
  // }

  updateMyLocation() async {
    print('updateMyLocation');
    positionStream = Geolocator.getPositionStream(distanceFilter: 100)
        .listen((myLocation) async {
      receivingAtsigns.forEach((notification) async {
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
          String atkeyMicrosecondId =
              notification.key.split('-')[1].split('@')[0];
          AtKey atKey = newAtKey(5000, "locationnotify-$atkeyMicrosecondId",
              notification.receiver);
          try {
            var result = await atClient.put(
                atKey,
                LocationNotificationModel.convertLocationNotificationToJson(
                    notification));
          } catch (e) {
            print('error in sending location: $e');
          }
        }
      });
    });
  }

// error
// SEVERE|2021-01-28 14:25:33.371574|AtClientImpl|error in put: FormatException: Invalid radix-10 number (at character 2)
//  [{"id"
  updateMyLocation2() async {
    LatLng myLocation = await getMyLocation();
    // LatLng myLocation = LatLng(lat, long);
    if (receivingAtsigns.length > 0)
      timer = Timer.periodic(Duration(seconds: 5), (Timer t) async {
        if (myLocation != null) {
          receivingAtsigns.forEach((notification) async {
            bool isSend = false;

            if (notification.to == null)
              isSend = true;
            else if ((DateTime.now().difference(notification.from) >
                    Duration(seconds: 0)) &&
                (notification.to.difference(DateTime.now()) >
                    Duration(seconds: 0))) isSend = true;
            if (isSend) {
              notification.lat = myLocation.latitude;
              notification.long = myLocation.longitude;
              String atkeyMicrosecondId =
                  notification.key.split('-')[1].split('@')[0];
              AtKey atKey = newAtKey(5000, "locationnotify-$atkeyMicrosecondId",
                  notification.receiver);
              try {
                var result = await atClient.put(
                    atKey,
                    LocationNotificationModel.convertLocationNotificationToJson(
                        notification));
              } catch (e) {
                print('error in sending location: $e');
              }
            }
          });
        }
        myLocation = await getMyLocation();
        // myLocation = LatLng(44, -112);
      });
  }

  manualLocationSend() {
    // LatLng myLocation = LatLng(lat, long);
    LatLng myLocation;
    if (myLocation == null)
      switch (atClient.currentAtSign) {
        case '@ashish🛠':
          {
            myLocation = LatLng(38, -122.406417);
            break;
          }
        case '@colin🛠':
          {
            myLocation = LatLng(39, -122.406417);
            break;
          }
        case '@bob🛠':
          {
            myLocation = LatLng(40, -122.406417);
            break;
          }
      }

    if (receivingAtsigns.length > 0)
      timer = Timer.periodic(Duration(seconds: 5), (Timer t) async {
        receivingAtsigns.forEach((notification) async {
          if (true) {
            notification.lat = myLocation.latitude;
            notification.long = myLocation.longitude;
            String atkeyMicrosecondId =
                notification.key.split('-')[1].split('@')[0];
            AtKey atKey = newAtKey(5000, "locationnotify-$atkeyMicrosecondId",
                notification.receiver);
            try {
              // var result = await
              atClient.put(
                  atKey,
                  LocationNotificationModel.convertLocationNotificationToJson(
                      notification));
            } catch (e) {
              print('error in sending location: $e');
            }
          }
        });
        myLocation.latitude = myLocation.latitude + 0.01;
      });
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
