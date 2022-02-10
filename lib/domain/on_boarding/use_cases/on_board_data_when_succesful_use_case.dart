import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:atsign_location_app/domain/on_boarding/i_atsign_on_boarding_facade.dart';
import 'package:injectable/injectable.dart';

@injectable
class OnBoardDataWhenSuccessful {
  OnBoardDataWhenSuccessful(this._iAtsignOnBoardingFacade);

  final IAtsignOnBoardingFacade _iAtsignOnBoardingFacade;

  void call(
    Map<String?, AtClientService> value,
    String? atSign,
  ) =>
      _iAtsignOnBoardingFacade.onBoardDataWhenSuccessful(value, atSign);
}
