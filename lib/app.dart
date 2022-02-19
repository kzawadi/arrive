import 'package:atsign_location_app/l10n/l10n.dart';
import 'package:atsign_location_app/presentation/routes/router.gr.dart'
    as app_router;
import 'package:atsign_location_app/presentation/routes/routes_observer.dart';
import 'package:atsign_location_app/presentation/themes/themes.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ArriveApp extends StatelessWidget {
  const ArriveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = app_router.Router();
    return MaterialApp.router(
      title: '@rrive',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [ArriveRouteObserver()],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (context, router) => router!,
      theme: Themes.lightTheme,
    );
  }
}
