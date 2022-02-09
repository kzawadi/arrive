import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:atsign_location_app/domain/on_boarding/onboarding_failures.dart';
import 'package:dartz/dartz.dart';

abstract class IAtsignOnBoardingFacade {
  Future<Either<OnBoardingFailure, AtClientPreference>>
      loadAtClientPreference();

  // Future<Option<Directory>> getApplicationSupportsDirectory();

  Future<Option<String>> getSignedInUser();
}
