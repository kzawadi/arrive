import 'package:at_contacts_flutter/at_contacts_flutter.dart';
import 'package:at_contacts_group_flutter/at_contacts_group_flutter.dart';
import 'package:atsign_location_app/presentation/events/event_log_page.dart';
import 'package:atsign_location_app/presentation/home/drawer.dart';
import 'package:atsign_location_app/presentation/location/compass/compas_view.dart';
import 'package:atsign_location_app/presentation/location/location_page.dart';
import 'package:atsign_location_app/presentation/location/map_widget.dart';
import 'package:atsign_location_app/presentation/splash/splash.dart';
import 'package:atsign_location_app/presentation/website_webview/website_webview.dart';
import 'package:auto_route/annotations.dart';
import 'package:injectable/injectable.dart';

/*
Using Auto route helps a lot in  navigation it allows for strongly-typed
arguments passing , effortless deep-linking and is uses code generation to
simplify routes setup

This will eliminated the boilerplate and a need to to use named/generated
routes and you’ll end up writing a lot of boilerplate code for mediator argument
classes, checking for required arguments, extracting arguments and a bunch of 
other stuff. AutoRoute does all that for you and much more.
*/
@singleton
@CupertinoAutoRouter(
  routes: <AutoRoute>[
    // AutoRoute<dynamic>(page: OnBoarding),
    AutoRoute<dynamic>(page: LocationPage),
    AutoRoute<dynamic>(page: ContactsScreen),
    AutoRoute<dynamic>(page: EventLog),
    AutoRoute<dynamic>(page: BlockedScreen),
    AutoRoute<dynamic>(page: GroupList),
    AutoRoute<dynamic>(page: WebsiteScreen),
    AutoRoute<dynamic>(page: LocationViewer),
    AutoRoute<dynamic>(page: CompasView),
    AutoRoute<dynamic>(page: SideDrawer),
    AutoRoute<dynamic>(page: OnBoarding, initial: true),
  ],
)
class $Router {}
