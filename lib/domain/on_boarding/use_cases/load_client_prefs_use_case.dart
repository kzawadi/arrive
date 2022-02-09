import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:atsign_location_app/application/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:atsign_location_app/domain/on_boarding/i_atsign_on_boarding.dart';
import 'package:atsign_location_app/domain/on_boarding/onboarding_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

///This is a use case which return an [Either] of [OnBoardingFailure] or
///the instance of [AtClientPreference] and in [OnBoardingBloc] we can handle
///the failure by emitting appropriate [OnBoardingState]'s
///this way it made it very easier to handle success and failures and do
///something logic wise from either outcomes
@injectable
class LoadAtClientPreferenceUseCase {
  const LoadAtClientPreferenceUseCase(this._iAtsignOnBoardingFacade);

  final IAtsignOnBoardingFacade _iAtsignOnBoardingFacade;

  Future<Either<OnBoardingFailure, AtClientPreference>> call() =>
      _iAtsignOnBoardingFacade.loadAtClientPreference();
}
