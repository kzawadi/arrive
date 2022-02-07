import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_bloc_event.dart';
part 'splash_bloc_state.dart';
part 'splash_bloc_bloc.freezed.dart';

class SplashBlocBloc extends Bloc<SplashBlocEvent, SplashBlocState> {
  SplashBlocBloc() : super(const _Initial()) {
    on<SplashBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
