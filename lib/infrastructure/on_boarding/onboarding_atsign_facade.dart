import 'dart:io';

import 'package:at_app_flutter/at_app_flutter.dart' show AtEnv;
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:atsign_location_app/domain/on_boarding/i_atsign_on_boarding.dart';
import 'package:atsign_location_app/domain/on_boarding/onboarding_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationSupportDirectory;

@LazySingleton(as: IAtsignOnBoardingFacade)
class OnboardingAtsignFacade implements IAtsignOnBoardingFacade {
  @override
  Future<Option<String>> getSignedInUser() async {
    final AtClient atClient = AtClientManager.getInstance().atClient;
    return optionOf(atClient.getCurrentAtSign());
  }

  @override
  Future<Either<OnBoardingFailure, AtClientPreference>>
      loadAtClientPreference() async {
    final t = await getApplicationSupportsDirectory.call();
    return t.fold(
      () => left(
        const OnBoardingFailure.failedToGetgetApplicationSupportDirectory(),
      ),
      (a) {
        return right(
          AtClientPreference()
            ..rootDomain = AtEnv.rootDomain
            ..namespace = AtEnv.appNamespace
            ..hiveStoragePath = a.path
            ..commitLogPath = a.path
            ..isLocalStoreRequired = true,
        );
      },
    );
  }

  Future<Option<Directory>> getApplicationSupportsDirectory() async {
    final Directory dir = await getApplicationSupportDirectory();
    return optionOf(dir);
  }
}
