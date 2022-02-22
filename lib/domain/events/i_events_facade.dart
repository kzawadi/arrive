import 'package:atsign_location_app/domain/events/events_failures.dart';
import 'package:atsign_location_app/domain/location/models/event_and_location.dart';
import 'package:dartz/dartz.dart';

abstract class IEventsFacade {
  Stream<List<EventAndLocationHybrid>>? getEventsStream();
  Stream<Either<EventsFailure, List<EventAndLocationHybrid>>> getPastEvents();
}
