import 'dart:async';
import 'dart:developer';

import 'package:at_utils/at_logger.dart';
import 'package:atsign_location_app/injections.dart';
import 'package:atsign_location_app/shared/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

//This is a entry with all the necesary app level initializations
//things like ensuring initializaion and BloC Observer,environment variables and
// the [AtSignLogger].
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Load the environment variables from the .env file.
      /// Directly calls load from the dotenv package.
      await Constants.load();
      configureInjection(Environment.prod);
      AtSignLogger.root_level = 'all';

      await BlocOverrides.runZoned(
        () async {
          await SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]).then(
            (value) async {
              await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge)
                  .then((value) {});
              runApp(await builder());
            },
          );

          // runApp(await builder());
        },
        blocObserver: AppBlocObserver(),
        eventTransformer: sequential<dynamic>(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
