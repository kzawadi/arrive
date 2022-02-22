import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_failures.freezed.dart';

@freezed
class EventsFailure with _$EventsFailure {
  const factory EventsFailure.serverError() = ServerError;
}
