import 'package:atsign_location_app/domain/events/i_events_facade.dart';
import 'package:atsign_location_app/domain/location/models/event_and_location.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetEventsStreamUseCase {
  GetEventsStreamUseCase(this._eventsFacade);

  final IEventsFacade _eventsFacade;

  Stream<List<EventAndLocationHybrid>>? call() =>
      _eventsFacade.getEventsStream();
}
