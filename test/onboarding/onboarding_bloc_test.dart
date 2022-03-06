import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:atsign_location_app/application/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:atsign_location_app/domain/contacts/i_contacts_facade.dart';
import 'package:atsign_location_app/domain/contacts/use_cases/at_contacts_use_cases.dart';
import 'package:atsign_location_app/domain/on_boarding/i_atsign_on_boarding_facade.dart';
import 'package:atsign_location_app/domain/on_boarding/use_cases/on_boarding_use_cases.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
// import 'package:mockito/mockito.dart';

class MockIOnboardingFacade extends Mock implements IAtsignOnBoardingFacade {}

class MockIContactsFacade extends Mock implements IContactsFacade {}

class MockLoadAtClientPreferenceUseCase extends Mock
    implements LoadAtClientPreferenceUseCase {}

class MockGetOnBoardedAtSignUseCase extends Mock
    implements GetOnBoardedAtSignUseCase {}

class MockOnBoardDataWhenSuccessfulUseCase extends Mock
    implements OnBoardDataWhenSuccessfulUseCase {}

class MockAtContactInitializationUseCase extends Mock
    implements AtContactInitializationUseCase {}

void main() {
  late LoadAtClientPreferenceUseCase _loadAtClientPreferenceUseCase;
  late GetOnBoardedAtSignUseCase _getOnBoardedAtSignUseCase;
  late OnBoardDataWhenSuccessfulUseCase _onBoardDataWhenSuccessfulUseCase;
  late IAtsignOnBoardingFacade _iAtsignOnBoardingFacade;
  late AtContactInitializationUseCase _atContactInitializationUseCase;
  late IContactsFacade _iContactsFacade;

  setUpAll(
    () {
      _loadAtClientPreferenceUseCase = MockLoadAtClientPreferenceUseCase();
      _getOnBoardedAtSignUseCase = MockGetOnBoardedAtSignUseCase();
      _iAtsignOnBoardingFacade = MockIOnboardingFacade();
      _iContactsFacade = MockIContactsFacade();
      _onBoardDataWhenSuccessfulUseCase =
          MockOnBoardDataWhenSuccessfulUseCase();
      _atContactInitializationUseCase =
          AtContactInitializationUseCase(_iContactsFacade);
    },
  );

  group(
    'OnboardingBlocTest -',
    () {
      test(
        'initial state is correct ${const OnBoardingState.initial()}',
        () {
          final onBoardingBloc = OnBoardingBloc(
            _loadAtClientPreferenceUseCase,
            _getOnBoardedAtSignUseCase,
            _onBoardDataWhenSuccessfulUseCase,
            _atContactInitializationUseCase,
          );
          expect(onBoardingBloc.state, const OnBoardingState.initial());
        },
      );
    },
  );

  group(
    'emits AtClient Preference when succesful',
    () {
      final atClientPrfs = AtClientPreference();
      const String atSign = '@kelvin';
      blocTest<OnBoardingBloc, OnBoardingState>(
        'emits loading',
        setUp: () {
          when(() => _loadAtClientPreferenceUseCase.call())
              .thenAnswer((_) => Future.value(right(atClientPrfs)));
        },
        build: () => OnBoardingBloc(
          _loadAtClientPreferenceUseCase,
          _getOnBoardedAtSignUseCase,
          _onBoardDataWhenSuccessfulUseCase,
          _atContactInitializationUseCase,
        ),
        act: (bloc) => bloc.add(const OnBoardingEvent.onBoardingAtSign()),
        expect: () => <OnBoardingState>[OnBoardingState.loading(atClientPrfs)],
      );
    },
  );
  group(
    'Gives AtClientService and atSign then emit OnBoardingState.loadSuccess ',
    () {
      // final atClientPrfs = AtClientPreference();
      const String atSign = '@kelvins';
      final AtClientService f = AtClientService();
      final Map<String?, AtClientService> atClientServiceMap = {'': f};

      blocTest<OnBoardingBloc, OnBoardingState>(
        'emits loadSuccess',
        setUp: () {
          when(() => _iAtsignOnBoardingFacade.call())
              .thenAnswer((_) => optionOf(atSign));
        },
        build: () => OnBoardingBloc(
          _loadAtClientPreferenceUseCase,
          _getOnBoardedAtSignUseCase,
          _onBoardDataWhenSuccessfulUseCase,
          _atContactInitializationUseCase,
        ),
        act: (bloc) => bloc.add(
          OnBoardingEvent.atSignOnBoardingSucces(atClientServiceMap, atSign),
        ),
        expect: () => <OnBoardingState>[
          OnBoardingState.loadSuccess(optionOf(atSign)),
        ],
      );
    },
  );
}
