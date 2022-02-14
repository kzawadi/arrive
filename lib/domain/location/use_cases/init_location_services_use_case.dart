import 'package:atsign_location_app/domain/location/i_location_facade.dart';
import 'package:atsign_location_app/infrastructure/location/location_facade.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class InitLocationServicesUseCase {
  InitLocationServicesUseCase(this._iLocationFacade);

  final LocationFacade _iLocationFacade;

  Future<Unit> call(
    GlobalKey<NavigatorState> navKey,
  ) async =>
      _iLocationFacade.init(navKey);
}
