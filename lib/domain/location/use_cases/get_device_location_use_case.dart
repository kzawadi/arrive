import 'package:atsign_location_app/domain/location/i_location_facade.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLocationStatusUseCase {
  GetLocationStatusUseCase(this._iLocationFacade);
  final ILocationFacade _iLocationFacade;

  Stream<Option<Position>> call() => _iLocationFacade.getMyLocationStatus();
}
