import 'dart:io';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_onboarding_flutter/at_onboarding_flutter.dart';
import 'package:atsign_location_app/application/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:atsign_location_app/domain/on_boarding/i_atsign_on_boarding_facade.dart';
import 'package:atsign_location_app/domain/on_boarding/onboarding_failures.dart';
import 'package:atsign_location_app/infrastructure/on_boarding/backend_service.dart';
import 'package:atsign_location_app/shared/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationSupportDirectory;

/// Implementation of [IAtsignOnBoardingFacade] interface

@LazySingleton(as: IAtsignOnBoardingFacade)
class OnboardingAtsignFacade implements IAtsignOnBoardingFacade {
  late BackendService _backendService;

  // late AtClientPreference atClientPreference;
  @override
  Option<String> getOnBoardedAtSign() {
    final AtClient atClient = AtClientManager.getInstance().atClient;
    return optionOf(atClient.getCurrentAtSign());
  }

  ///This Functional (using functinal programming Haskel like) function
  /// return the [AtClientPreference] instance to be used in [Onboarding]
  /// function also if failures arise (showing a @user an exactly failures
  /// in a nice UI instead of just throwing them as if the @user knows them)
  /// at this stage we delivery them to the [OnBoardingBloc] so it can be party
  /// of App logic
  @override
  Future<Either<OnBoardingFailure, AtClientPreference>>
      loadAtClientPreference() async {
    BackendService.getInstance().atClientPreference =
        await BackendService.getInstance().getAtClientPreference();
    _backendService = BackendService.getInstance();
    return right(BackendService.getInstance().atClientPreference);
  }

  ///A helper function to fetch Path to a directory where the application
  /// may place application support files.
  Future<Option<Directory>> getApplicationSupportsDirectory() async {
    final Directory dir = await getApplicationSupportDirectory();
    return optionOf(dir);
  }

  @override
  Future onBoardDataWhenSuccessful(
    Map<String?, AtClientService> v,
    String? atSign,
  ) async {
    await loadAtClientPreference().then(
      (value) {
        value.fold(
          (l) => false,
          (atClientPreference) async {
            await AtClientManager.getInstance().setCurrentAtSign(
              atSign!,
              Constants.appNamespace,
              atClientPreference,
            );
            _backendService
              ..atClientServiceMap = v
              ..atSign = atSign;

            // _backendService.atClientServiceMap[atSign]!
            // .makeAtSignPrimary(atsign);

            // await _backendService.startMonitor(atsign: atsign, value: value);

            await KeychainUtil.makeAtSignPrimary(atSign);
            //sync with secondary server
            AtClientManager.getInstance().syncService.sync();

            return true;
          },
        );
      },
    );
  }
}
