part of 'drawer_cubit.dart';

@freezed
class DrawerState with _$DrawerState {
  const factory DrawerState.initial() = _Initial;

  const factory DrawerState.atSignLoaded(Option<String> atSign) = _AtSignLoaded;
}
