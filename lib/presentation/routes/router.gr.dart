// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:at_contact/at_contact.dart' as _i10;
import 'package:at_contacts_flutter/at_contacts_flutter.dart' as _i3;
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/cupertino.dart' as _i9;
import 'package:flutter/material.dart' as _i8;

import '../home/home_page.dart' as _i2;
import '../location/compass/compas_view.dart' as _i5;
import '../location/location_page.dart' as _i4;
import '../on_boarding/on_boarding_page.dart' as _i6;
import '../splash/splash.dart' as _i1;

class Router extends _i7.RootStackRouter {
  Router([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    OnBoardingRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.OnBoarding());
    },
    HomePageRoute.name: (routeData) {
      final args = routeData.argsAs<HomePageRouteArgs>();
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i2.HomePage(key: args.key, atSign: args.atSign));
    },
    ContactsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ContactsScreenRouteArgs>(
          orElse: () => const ContactsScreenRouteArgs());
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i3.ContactsScreen(
              key: args.key,
              selectedList: args.selectedList,
              context: args.context,
              asSelectionScreen: args.asSelectionScreen,
              asSingleSelectionScreen: args.asSingleSelectionScreen,
              saveGroup: args.saveGroup,
              onSendIconPressed: args.onSendIconPressed));
    },
    LocationPageRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.LocationPage());
    },
    CompasViewRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i5.CompasView());
    },
    OnBoardingPageRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i6.OnBoardingPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(OnBoardingRoute.name, path: '/on-boarding'),
        _i7.RouteConfig(HomePageRoute.name, path: '/home-page'),
        _i7.RouteConfig(ContactsScreenRoute.name, path: '/contacts-screen'),
        _i7.RouteConfig(LocationPageRoute.name, path: '/location-page'),
        _i7.RouteConfig(CompasViewRoute.name, path: '/compas-view'),
        _i7.RouteConfig(OnBoardingPageRoute.name, path: '/')
      ];
}

/// generated route for
/// [_i1.OnBoarding]
class OnBoardingRoute extends _i7.PageRouteInfo<void> {
  const OnBoardingRoute() : super(OnBoardingRoute.name, path: '/on-boarding');

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i7.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({_i9.Key? key, required String atSign})
      : super(HomePageRoute.name,
            path: '/home-page',
            args: HomePageRouteArgs(key: key, atSign: atSign));

  static const String name = 'HomePageRoute';
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key, required this.atSign});

  final _i9.Key? key;

  final String atSign;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key, atSign: $atSign}';
  }
}

/// generated route for
/// [_i3.ContactsScreen]
class ContactsScreenRoute extends _i7.PageRouteInfo<ContactsScreenRouteArgs> {
  ContactsScreenRoute(
      {_i9.Key? key,
      void Function(List<_i10.AtContact?>)? selectedList,
      _i9.BuildContext? context,
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

  final _i9.Key? key;

  final void Function(List<_i10.AtContact?>)? selectedList;

  final _i9.BuildContext? context;

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
/// [_i4.LocationPage]
class LocationPageRoute extends _i7.PageRouteInfo<void> {
  const LocationPageRoute()
      : super(LocationPageRoute.name, path: '/location-page');

  static const String name = 'LocationPageRoute';
}

/// generated route for
/// [_i5.CompasView]
class CompasViewRoute extends _i7.PageRouteInfo<void> {
  const CompasViewRoute() : super(CompasViewRoute.name, path: '/compas-view');

  static const String name = 'CompasViewRoute';
}

/// generated route for
/// [_i6.OnBoardingPage]
class OnBoardingPageRoute extends _i7.PageRouteInfo<void> {
  const OnBoardingPageRoute() : super(OnBoardingPageRoute.name, path: '/');

  static const String name = 'OnBoardingPageRoute';
}
