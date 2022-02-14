import 'package:atsign_location_app/application/location/bloc/location_bloc.dart';
import 'package:atsign_location_app/infrastructure/location/location_facade.dart';
import 'package:atsign_location_app/injections.dart';
import 'package:atsign_location_app/presentation/routes/router.gr.dart'
    as app_router;
import 'package:atsign_location_app/presentation/location/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = app_router.Router();

    // final GlobalKey<NavigatorState> navKey = GlobalKey();
    return BlocProvider<LocationBloc>(
      create: (context) => getIt<LocationBloc>()
        ..add(
          LocationEvent.started(
            _appRouter.navigatorKey,
          ),
        ),
      child: LocationViewer(),
      // Scaffold(
      //   appBar: AppBar(
      //     title: const Text('MAP'),
      //   ),
      //   body: const LocationViewer(),
      // ),
    );

    // BlocConsumer<LocationblocBloc, LocationblocState>(
    //   listener: (context, o) {},
    //   builder: (context, state) {
    //     return Scaffold(
    //       appBar: AppBar(
    //         title: const Text('MAP'),
    //       ),
    //       body: const LocationWidget(),
    //     );
    //   },
    // );
  }
}
