// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:at_contact/at_contact.dart' as _i12;
import 'package:at_contacts_flutter/at_contacts_flutter.dart' as _i2;
import 'package:at_contacts_group_flutter/at_contacts_group_flutter.dart'
    as _i4;
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../events/event_log_page.dart' as _i3;
import '../home/drawer.dart' as _i8;
import '../location/compass/compas_view.dart' as _i7;
import '../location/location_page.dart' as _i1;
import '../location/map_widget.dart' as _i6;
import '../splash/splash.dart' as _i9;
import '../website_webview/website_webview.dart' as _i5;

class Router extends _i10.RootStackRouter {
  Router([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    LocationPageRoute.name: (routeData) {
      return _i10.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.LocationPage());
    },
    ContactsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ContactsScreenRouteArgs>(
          orElse: () => const ContactsScreenRouteArgs());
      return _i10.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i2.ContactsScreen(
              key: args.key,
              selectedList: args.selectedList,
              context: args.context,
              asSelectionScreen: args.asSelectionScreen,
              asSingleSelectionScreen: args.asSingleSelectionScreen,
              saveGroup: args.saveGroup,
              onSendIconPressed: args.onSendIconPressed));
    },
    EventLogRoute.name: (routeData) {
      return _i10.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i3.EventLog());
    },
    BlockedScreenRoute.name: (routeData) {
      return _i10.CupertinoPageX<dynamic>(
          routeData: routeData, child: _i2.BlockedScreen());
    },
    GroupListRoute.name: (routeData) {
      return _i10.CupertinoPageX<dynamic>(
          routeData: routeData, child: _i4.GroupList());
    },
    WebsiteScreenRoute.name: (routeData) {
      final args = routeData.argsAs<WebsiteScreenRouteArgs>();
      return _i10.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i5.WebsiteScreen(
              key: args.key, title: args.title, url: args.url));
    },
    LocationViewerRoute.name: (routeData) {
      return _i10.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i6.LocationViewer());
    },
    CompassViewRoute.name: (routeData) {
      final args = routeData.argsAs<CompassViewRouteArgs>();
      return _i10.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i7.CompassView(
              key: args.key,
              heading: args.heading,
              foregroundColor: args.foregroundColor,
              bearingColor: args.bearingColor));
    },
    SideDrawerRoute.name: (routeData) {
      return _i10.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i8.SideDrawer());
    },
    OnBoardingRoute.name: (routeData) {
      return _i10.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i9.OnBoarding());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(LocationPageRoute.name, path: '/location-page'),
        _i10.RouteConfig(ContactsScreenRoute.name, path: '/contacts-screen'),
        _i10.RouteConfig(EventLogRoute.name, path: '/event-log'),
        _i10.RouteConfig(BlockedScreenRoute.name, path: '/blocked-screen'),
        _i10.RouteConfig(GroupListRoute.name, path: '/group-list'),
        _i10.RouteConfig(WebsiteScreenRoute.name, path: '/website-screen'),
        _i10.RouteConfig(LocationViewerRoute.name, path: '/location-viewer'),
        _i10.RouteConfig(CompassViewRoute.name, path: '/compass-view'),
        _i10.RouteConfig(SideDrawerRoute.name, path: '/side-drawer'),
        _i10.RouteConfig(OnBoardingRoute.name, path: '/')
      ];
}

/// generated route for
/// [_i1.LocationPage]
class LocationPageRoute extends _i10.PageRouteInfo<void> {
  const LocationPageRoute()
      : super(LocationPageRoute.name, path: '/location-page');

  static const String name = 'LocationPageRoute';
}

/// generated route for
/// [_i2.ContactsScreen]
class ContactsScreenRoute extends _i10.PageRouteInfo<ContactsScreenRouteArgs> {
  ContactsScreenRoute(
      {_i11.Key? key,
      void Function(List<_i12.AtContact?>)? selectedList,
      _i11.BuildContext? context,
      bool asSelectionScreen = false,
      bool asSingleSelectionScreen = false,
      Function? saveGroup,
      Function? onSendIconPressed})
      : super(ContactsScreenRoute.name,
            path: '/contacts-screen',
            args: ContactsScreenRouteArgs(
                key: key,
                selectedList: selectedList,
                context: context,
                asSelectionScreen: asSelectionScreen,
                asSingleSelectionScreen: asSingleSelectionScreen,
                saveGroup: saveGroup,
                onSendIconPressed: onSendIconPressed));

  static const String name = 'ContactsScreenRoute';
}

class ContactsScreenRouteArgs {
  const ContactsScreenRouteArgs(
      {this.key,
      this.selectedList,
      this.context,
      this.asSelectionScreen = false,
      this.asSingleSelectionScreen = false,
      this.saveGroup,
      this.onSendIconPressed});

  final _i11.Key? key;

  final void Function(List<_i12.AtContact?>)? selectedList;

  final _i11.BuildContext? context;

  final bool asSelectionScreen;

  final bool asSingleSelectionScreen;

  final Function? saveGroup;

  final Function? onSendIconPressed;

  @override
  String toString() {
    return 'ContactsScreenRouteArgs{key: $key, selectedList: $selectedList, context: $context, asSelectionScreen: $asSelectionScreen, asSingleSelectionScreen: $asSingleSelectionScreen, saveGroup: $saveGroup, onSendIconPressed: $onSendIconPressed}';
  }
}

/// generated route for
/// [_i3.EventLog]
class EventLogRoute extends _i10.PageRouteInfo<void> {
  const EventLogRoute() : super(EventLogRoute.name, path: '/event-log');

  static const String name = 'EventLogRoute';
}

/// generated route for
/// [_i2.BlockedScreen]
class BlockedScreenRoute extends _i10.PageRouteInfo<void> {
  const BlockedScreenRoute()
      : super(BlockedScreenRoute.name, path: '/blocked-screen');

  static const String name = 'BlockedScreenRoute';
}

/// generated route for
/// [_i4.GroupList]
class GroupListRoute extends _i10.PageRouteInfo<void> {
  const GroupListRoute() : super(GroupListRoute.name, path: '/group-list');

  static const String name = 'GroupListRoute';
}

/// generated route for
/// [_i5.WebsiteScreen]
class WebsiteScreenRoute extends _i10.PageRouteInfo<WebsiteScreenRouteArgs> {
  WebsiteScreenRoute(
      {_i11.Key? key, required String title, required String url})
      : super(WebsiteScreenRoute.name,
            path: '/website-screen',
            args: WebsiteScreenRouteArgs(key: key, title: title, url: url));

  static const String name = 'WebsiteScreenRoute';
}

class WebsiteScreenRouteArgs {
  const WebsiteScreenRouteArgs(
      {this.key, required this.title, required this.url});

  final _i11.Key? key;

  final String title;

  final String url;

  @override
  String toString() {
    return 'WebsiteScreenRouteArgs{key: $key, title: $title, url: $url}';
  }
}

/// generated route for
/// [_i6.LocationViewer]
class LocationViewerRoute extends _i10.PageRouteInfo<void> {
  const LocationViewerRoute()
      : super(LocationViewerRoute.name, path: '/location-viewer');

  static const String name = 'LocationViewerRoute';
}

/// generated route for
/// [_i7.CompassView]
class CompassViewRoute extends _i10.PageRouteInfo<CompassViewRouteArgs> {
  CompassViewRoute(
      {_i11.Key? key,
      required double heading,
      _i11.Color foregroundColor = _i11.Colors.black,
      _i11.Color bearingColor = _i11.Colors.red})
      : super(CompassViewRoute.name,
            path: '/compass-view',
            args: CompassViewRouteArgs(
                key: key,
                heading: heading,
                foregroundColor: foregroundColor,
                bearingColor: bearingColor));

  static const String name = 'CompassViewRoute';
}

class CompassViewRouteArgs {
  const CompassViewRouteArgs(
      {this.key,
      required this.heading,
      this.foregroundColor = _i11.Colors.black,
      this.bearingColor = _i11.Colors.red});

  final _i11.Key? key;

  final double heading;

  final _i11.Color foregroundColor;

  final _i11.Color bearingColor;

  @override
  String toString() {
    return 'CompassViewRouteArgs{key: $key, heading: $heading, foregroundColor: $foregroundColor, bearingColor: $bearingColor}';
  }
}

/// generated route for
/// [_i8.SideDrawer]
class SideDrawerRoute extends _i10.PageRouteInfo<void> {
  const SideDrawerRoute() : super(SideDrawerRoute.name, path: '/side-drawer');

  static const String name = 'SideDrawerRoute';
}

/// generated route for
/// [_i9.OnBoarding]
class OnBoardingRoute extends _i10.PageRouteInfo<void> {
  const OnBoardingRoute() : super(OnBoardingRoute.name, path: '/');

  static const String name = 'OnBoardingRoute';
}
