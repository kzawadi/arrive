// import 'package:at_location_flutter/map_content/flutter_map/src/plugins/plugin.dart' as plugin;
// ignore_for_file: unused_import, unused_local_variable, lines_longer_than_80_chars

import 'package:at_location_flutter/utils/constants/constants.dart';
import 'package:atsign_location_app/shared/common_components/iconly_icon.dart';
import 'package:atsign_location_app/shared/common_components/icons_curved.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart' as plugin;
// import 'package:flutter_map/src/layer/marker_layer.dart' as layer;
import 'package:latlong2/latlong.dart';

/// A widget defined to show zero or one or a list of geo co-ordinates with custom marker.
///
/// [location] Co-ordinate on which marker needs to be shown.
///
/// [locationList] List of Co-ordinates on which markers needs to be shown.
///
/// [locationListMarker] Custom widget displayed as the marker.
///
///
class ArriveMap extends StatelessWidget {
  const ArriveMap({
    Key? key,
    this.location,
    this.locationList,
    this.locationListMarker,
    this.mapController,
  }) : super(key: key);

  final fm.MapController? mapController;
  final LatLng? location;
  final List<LatLng>? locationList;
  final Widget? locationListMarker;
  //bool moveMap = true;

  @override
  Widget build(BuildContext context) {
    return fm.FlutterMap(
      key: key,
      mapController: mapController ?? fm.MapController(),
      options: fm.MapOptions(
        center: location,
        zoom: 15,
        controller: mapController,
      ),
      layers: [
        fm.TileLayerOptions(
          minNativeZoom: 2,
          maxNativeZoom: 18,
          minZoom: 1,
          urlTemplate:
              'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=${MixedConstants.MAP_KEY}',
        ),
        fm.MarkerLayerOptions(
          markers: [
            fm.Marker(
              // width: 30,
              // height: 30,
              point: LatLng(location!.latitude, location!.longitude),
              builder: (ctx) => const IconlyIcon(
                path: IconlyCurved.Location_bold,
                color: Colors.black,
                size: 70,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Widget showLocation(
//   Key? key,
//   fm.MapController? mapController, {
//   LatLng? location,
//   List<LatLng>? locationList,
//   Widget? locationListMarker,
//   // bool moveMap = true,
// }) {
//   // bool showMarker;
//   // fm.Marker marker;
//   // List<fm.Marker>? markerList;

//   return Scaffold(
//     body: SafeArea(
//       child: fm.FlutterMap(
//         key: key,
//         mapController: mapController ?? fm.MapController(),
//         options: fm.MapOptions(
//           center: location,
//           zoom: 15,
//           controller: mapController,
//         ),
//         layers: [
//           fm.TileLayerOptions(
//             minNativeZoom: 2,
//             maxNativeZoom: 18,
//             minZoom: 1,
//             urlTemplate:
//                 'https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=${MixedConstants.MAP_KEY}',
//           ),
//           fm.MarkerLayerOptions(
//             markers: [
//               fm.Marker(
//                 width: 25,
//                 height: 25,
//                 point: LatLng(location!.latitude, location.longitude),
//                 builder: (ctx) => const IconlyIcon(
//                   path: IconlyCurved.Location_bold,
//                   color: Colors.black,
//                   size: 70,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }
