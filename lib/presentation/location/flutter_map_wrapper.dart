import 'package:at_location_flutter/at_location_flutter.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map/plugin_api.dart';

class MapWrapperController {
  MapWrapperController();

  _FlutterMapWrapperState? _state;
  bool _controllerReady = false;

  MapController? _controller;
  MapController get controller => _controller!;
  void _setController(MapController controller) {
    _controllerReady = false;
    _controller = controller;
    _controller!.onReady.then((_) => _controllerReady = true);
  }

  bool get readyAndMounted =>
      _state?.mounted == true && _controller != null && _controllerReady;
}

/// Wrapper for preventing `LateInitializationError` and `Bad state: Cannot add new events after calling close`.
///
/// Usage:
/// 1. Create a MapWrapperController (for example in initState() in the StatefulWidget that contains the map).
/// 2. Supply the MapWrapperController-instance as [wrapperController] to your FlutterMapWrapper widget.
/// 3. Use [controller] on the MapWrapperController-instance to call controller methods (e.g. move(), rotate(), fitBounds(), etc.).
/// 4. Before calling a controller method, always check that [readyAndMounted] is true first!
///
/// Example:
///
/// ```
/// MapWrapperController mapWrapperController;
///
/// @override
/// initState() {
///   super.initState();
///   mapWrapperController = MapWrapperController();
/// }
///
/// void locationUpdated(LatLng coords){
///   if( mapWrapperController.readyAndMounted ) {
///     mapWrapperController.controller.move(coords, mapWrapperController.controller.zoom);
///   }
/// }
///
/// @override
/// Widget build(BuildContext context) {
///   return FlutterMapWrapper(
///     wrapperController: mapWrapperController,
///     options: MapOptions(
///       crs: Epsg3857(),
///       zoom: 9.0,
///       maxZoom: 13.0,
///       minZoom: 1.0
///     ),
///     layers: myLayers,
///   );
/// }
/// ```
class FlutterMapWrapper extends StatefulWidget {
  const FlutterMapWrapper({
    Key? key,
    this.wrapperController,
    this.options,
    this.mapKey,
    this.location,
    required this.moveMap,
    this.layers = const [],
    this.nonRotatedLayers = const [],
    this.children = const [],
    this.nonRotatedChildren = const [],
  }) : super(key: key);

  final MapWrapperController? wrapperController;
  final MapOptions? options;
  final List<LayerOptions> layers;
  final List<LayerOptions> nonRotatedLayers;
  final List<Widget> children;
  final List<Widget> nonRotatedChildren;
  final Key? mapKey;
  final LatLng? location;
  final bool moveMap;
  @override
  _FlutterMapWrapperState createState() => _FlutterMapWrapperState();
}

class _FlutterMapWrapperState extends State<FlutterMapWrapper> {
  MapController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = MapController();
    widget.wrapperController!._state = this;
    widget.wrapperController!._setController(_controller!);
  }

  @override
  Widget build(BuildContext context) {
    return showLocation(
      widget.mapKey,
      _controller,
      location: widget.location,
      moveMap: widget.moveMap,
    );
    // FlutterMap(
    //   options: widget.options,
    //   layers: widget.layers,
    //   nonRotatedLayers: widget.nonRotatedLayers,
    //   nonRotatedChildren: widget.nonRotatedChildren,
    //   mapController: _controller,
    //   children: widget.children,
    // );
  }
}
