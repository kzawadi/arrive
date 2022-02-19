// import 'package:at_contacts_group_flutter/services/navigation_service.dart';
import 'package:atsign_location_app/application/location/bloc/location_bloc.dart';
import 'package:atsign_location_app/injections.dart';
import 'package:atsign_location_app/presentation/location/map_widget.dart';
import 'package:atsign_location_app/presentation/routes/router.gr.dart'
    as app_router;
import 'package:auto_route/auto_route.dart';
// import 'package:atsign_location_app/presentation/routes/global_navigation_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = app_router.Router();
    final uwata = AutoRouter.of(context).navigatorKey;
    return BlocProvider<LocationBloc>(
      create: (context) => getIt<LocationBloc>()
        ..add(
          LocationEvent.started(uwata),
        ),
      child: const LocationViewer(),
    );
  }
}
