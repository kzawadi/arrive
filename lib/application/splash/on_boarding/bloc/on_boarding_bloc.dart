import 'dart:async';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:atsign_location_app/domain/on_boarding/onboarding_failures.dart';
import 'package:atsign_location_app/domain/on_boarding/use_cases/load_client_prefs_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';
part 'on_boarding_bloc.freezed.dart';

@injectable
class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc(this._loadAtClientPreference)
      : super(const OnBoardingState.initial()) {
    on<OnBoardingEvent>(_onBoardingEventHandler);
  }

  final LoadAtClientPreference _loadAtClientPreference;

  Future _onBoardingEventHandler(
    OnBoardingEvent event,
    Emitter<OnBoardingState> emit,
  ) async {
    await event.map(
      onBoardingAtSign: (e) async {
        final results = await _loadAtClientPreference();
        emit(
          results.fold(
            (l) => OnBoardingState.failure(l),
            (r) => OnBoardingState.loading(r),
          ),
        );
      },
    );
  }
}
