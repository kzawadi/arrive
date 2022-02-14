import 'package:at_events_flutter/models/event_key_location_model.dart';
import 'package:at_location_flutter/location_modal/key_location_model.dart';

class EventAndLocationHybrid {
  EventAndLocationHybrid(
    this.type, {
    this.locationKeyModel,
    this.eventKeyModel,
  });

  NotificationModelType type;
  KeyLocationModel? locationKeyModel;
  EventKeyLocationModel? eventKeyModel;
}

enum NotificationModelType { locationModel, eventModel }
