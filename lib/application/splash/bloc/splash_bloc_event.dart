part of 'splash_bloc_bloc.dart';

@freezed
class SplashBlocEvent with _$SplashBlocEvent {
  const factory SplashBlocEvent.started() = _Started;
}