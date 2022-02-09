import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:atsign_location_app/domain/on_boarding/i_atsign_on_boarding.dart';
import 'package:atsign_location_app/domain/on_boarding/onboarding_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoadAtClientPreference {
  const LoadAtClientPreference(this._iAtsignOnBoardingFacade);

  final IAtsignOnBoardingFacade _iAtsignOnBoardingFacade;

  Future<Either<OnBoardingFailure, AtClientPreference>> call() =>
      _iAtsignOnBoardingFacade.loadAtClientPreference();
}
