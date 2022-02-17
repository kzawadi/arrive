import 'package:at_location_flutter/map_content/flutter_map/flutter_map.dart';
import 'package:at_location_flutter/map_content/flutter_map/src/map/map.dart';
import 'package:injectable/injectable.dart';

@module
abstract class YourModuleName {
  // @lazySingleton // or @singleton
  // http.Client get httpClient => http.Client();
  @singleton
  // @Injectable(as: MapController)
  MapControllerImpl get mapController => MapControllerImpl();
}
