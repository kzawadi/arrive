// import 'dart:async';

// import 'package:at_client_mobile/at_client_mobile.dart';
// import 'package:at_contacts_flutter/utils/init_contacts_service.dart';
// import 'package:at_contacts_group_flutter/utils/init_group_service.dart';
// import 'package:at_location_flutter/at_location_flutter.dart';
// import 'package:atsign_location_app/domain/location/i_location_facade.dart';
// import 'package:atsign_location_app/shared/constants.dart';
// import 'package:flutter/widgets.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart';

// class Locationfacade implements ILocationFacade {
//   late LatLng myLatLng;
//   late StreamSubscription<Position> _positionStream;

//   void initializePlugins() {
//     String currentAtSign; //todo no need to fetch currentAtSign multiple times
//   currentAtSign = AtClientManager.getInstance().atClient.getCurrentAtSign()!;
//     // ignore: await_only_futures
//     initializeContactsService(rootDomain: Constants.rootDomain);
//     // setState(() {
//     //   contactsLoaded = true;
//     // });

//     initializeGroupService(rootDomain: Constants.rootDomain);
//   }

//   void _getLocationStatus() async {
//     await _getMyLocation();
//     // LatLng myLatLng;
//     Geolocator.getServiceStatusStream().listen((event) {
//       //  Key _mapKey = UniqueKey();
//       if (event == ServiceStatus.disabled) {
//         // setState(() {
//         myLatLng = null;
//         // });
//       } else if (event == ServiceStatus.enabled) {
//         _getMyLocation();
//       }
//     });
//   }

//   Future<void> _getMyLocation() async {
//     var newMyLatLng = await getMyLocation();
//     if (newMyLatLng != null) {
//       // setState(() {
//       //   myLatLng = newMyLatLng;
//       // });
//     }

//     var permission = await Geolocator.checkPermission();

//     if ((permission == LocationPermission.always) ||
//         (permission == LocationPermission.whileInUse)) {
//       if (_positionStream != null) {
//         await _positionStream.cancel();
//       }

//       _positionStream = Geolocator.getPositionStream(
//         locationSettings: const LocationSettings(distanceFilter: 2),
//       ).listen((locationStream) async {
//         // if (mounted) {
//         // setState(() {
//         myLatLng = LatLng(locationStream.latitude, locationStream.longitude);
//         // });
//         // }
//       });
//     }
//   }
// }
