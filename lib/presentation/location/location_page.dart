import 'package:at_location_flutter/at_location_flutter.dart';
import 'package:at_location_flutter/map_content/flutter_map/src/map/map.dart';
import 'package:atsign_location_app/application/location/bloc/location_bloc.dart';
import 'package:atsign_location_app/injections.dart';
import 'package:atsign_location_app/presentation/location/map_widget.dart';
import 'package:atsign_location_app/presentation/routes/router.gr.dart'
    as app_router;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  /// A [MapController], used to control the map.
  // final MapController? mapController = MapControllerImpl();

  @override
  Widget build(BuildContext context) {
    final _appRouter = app_router.Router();
    return BlocProvider<LocationBloc>(
      create: (context) => getIt<LocationBloc>()
        ..add(
          LocationEvent.started(
            _appRouter.navigatorKey,
          ),
        ),
      child: const LocationViewer(),
    );
  }
}
