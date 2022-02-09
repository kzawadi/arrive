// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../on_boarding/on_boarding_page.dart' as _i2;
import '../splash/splash.dart' as _i1;

class Router extends _i3.RootStackRouter {
  Router([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    OnBoardingRoute.name: (routeData) {
      return _i3.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.OnBoarding());
    },
    OnBoardingPageRoute.name: (routeData) {
      return _i3.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.OnBoardingPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(OnBoardingRoute.name, path: '/on-boarding'),
        _i3.RouteConfig(OnBoardingPageRoute.name, path: '/')
      ];
}

/// generated route for
/// [_i1.OnBoarding]
class OnBoardingRoute extends _i3.PageRouteInfo<void> {
  const OnBoardingRoute() : super(OnBoardingRoute.name, path: '/on-boarding');

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [_i2.OnBoardingPage]
class OnBoardingPageRoute extends _i3.PageRouteInfo<void> {
  const OnBoardingPageRoute() : super(OnBoardingPageRoute.name, path: '/');

  static const String name = 'OnBoardingPageRoute';
}
