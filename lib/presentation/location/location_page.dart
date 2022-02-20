import 'package:atsign_location_app/application/location/bloc/location_bloc.dart';
import 'package:atsign_location_app/injections.dart';
import 'package:atsign_location_app/presentation/location/map_widget.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navKey = AutoRouter.of(context).navigatorKey;
    return BlocProvider<LocationBloc>(
      lazy: false,
      create: (BuildContext context) => getIt<LocationBloc>()
        ..add(
          LocationEvent.started(navKey),
        ),
      child: const LocationViewer(),
    );
  }
}
