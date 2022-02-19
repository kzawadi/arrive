// import 'package:at_location_flutter/map_content/flutter_map/src/plugins/plugin.dart' as plugin;
import 'package:at_location_flutter/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart' as plugin;
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/src/layer/marker_layer.dart' as layer;

/// A widget defined to show zero or one or a list of geo co-ordinates with custom marker.
///
/// [location] Co-ordinate on which marker needs to be shown.
///
/// [locationList] List of Co-ordinates on which markers needs to be shown.
///
/// [locationListMarker] Custom widget displayed as the marker.
Widget showLocation(
  Key? key,
  fm.MapController? mapController, {
  LatLng? location,
  List<LatLng>? locationList,
  Widget? locationListMarker,
  bool moveMap = true,
}) {
  bool showMarker;
  fm.Marker marker;
  List<fm.Marker>? markerList;

  /// init
  // showMarker = true;
  // if (location != null) {
  //   marker = buildMarker(HybridModel(latLng: location), singleMarker: true);
  //   if ((mapController != null) && (moveMap)) {
  //     mapController.move(location, 8);
  //   }
  // } else {
  //   marker =
  //       buildMarker(HybridModel(latLng: LatLng(45, 45)), singleMarker: true);
  //   showMarker = false;
  // }

  // if (locationList != null) {
  //   markerList = [];
  //   for (var location in locationList) {
  // var marker = buildMarker(HybridModel(latLng: location),
  //     singleMarker: true, marker: locationListMarker);
  //     markerList.add(marker);
  //   }
  // }

  ///

  return Scaffold(
    body: SafeArea(
      child: fm.FlutterMap(
        key: key,
        mapController: mapController ?? fm.MapController(),
        options: fm.MapOptions(
          center: location,
          //  markerList != null
          //     ? markerList[0].point
          //     : (location != null)
          //         ? location
          //         : LatLng(45, 45),
          zoom: 15,
          controller: mapController,

          // markerList != null
          //     ? 5
          //     : (location != null)
          //         ? 15
          //         : 4,
          // plugins: [MapPlugin(UniqueKey())],
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
                width: 25,
                height: 25,
                point: LatLng(location!.latitude, location.longitude),
                builder: (ctx) => const FlutterLogo(),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


// class MarkerClusterPlugin extends MapPlugin {
//   final Key key;
//   MarkerClusterPlugin(this.key);
//   @override
//   Widget createLayer(
//       LayerOptions options,plugin. MapState? mapState, Stream<void> stream) {
//     return layer.MarkerClusterLayer(
//         options as MarkerClusterLayerOptions, mapState, stream, key);
//   }

//   @override
//   bool supportsLayer(LayerOptions options) {
//     return options is MarkerClusterLayerOptions;
//   }
// }
