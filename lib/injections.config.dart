// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/location/bloc/location_bloc.dart' as _i12;
import 'application/on_boarding/bloc/on_boarding_bloc.dart' as _i14;
import 'domain/contacts/i_contacts_facade.dart' as _i6;
import 'domain/contacts/use_cases/at_contact_initialization_use_case.dart'
    as _i17;
import 'domain/contacts/use_cases/at_contacts_use_cases.dart' as _i16;
import 'domain/location/i_location_facade.dart' as _i8;
import 'domain/location/use_cases/init_location_services_use_case.dart' as _i10;
import 'domain/on_boarding/i_atsign_on_boarding_facade.dart' as _i4;
import 'domain/on_boarding/use_cases/get_on_boarded_at_sign_use_case.dart'
    as _i18;
import 'domain/on_boarding/use_cases/load_client_prefs_use_case.dart' as _i11;
import 'domain/on_boarding/use_cases/on_board_data_when_succesful_use_case.dart'
    as _i13;
import 'domain/on_boarding/use_cases/on_boarding_use_cases.dart' as _i15;
import 'infrastructure/contacts/contacts_facade.dart' as _i7;
import 'infrastructure/location/location_facade.dart' as _i9;
import 'infrastructure/on_boarding/onboarding_atsign_facade.dart' as _i5;
import 'presentation/routes/router.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.$Router>(_i3.$Router());
  gh.lazySingleton<_i4.IAtsignOnBoardingFacade>(
      () => _i5.OnboardingAtsignFacade());
  gh.lazySingleton<_i6.IContactsFacade>(() => _i7.ContactsFacade());
  gh.lazySingleton<_i8.ILocationFacade>(() => _i9.LocationFacade());
  gh.factory<_i10.InitLocationServicesUseCase>(
      () => _i10.InitLocationServicesUseCase(get<_i8.ILocationFacade>()));
  gh.factory<_i11.LoadAtClientPreferenceUseCase>(() =>
      _i11.LoadAtClientPreferenceUseCase(get<_i4.IAtsignOnBoardingFacade>()));
  gh.factory<_i12.LocationBloc>(() => _i12.LocationBloc(
      get<_i10.InitLocationServicesUseCase>(), get<_i8.ILocationFacade>()));
  gh.factory<_i13.OnBoardDataWhenSuccessfulUseCase>(() =>
      _i13.OnBoardDataWhenSuccessfulUseCase(
          get<_i4.IAtsignOnBoardingFacade>()));
  gh.factory<_i14.OnBoardingBloc>(() => _i14.OnBoardingBloc(
      get<_i15.LoadAtClientPreferenceUseCase>(),
      get<_i15.GetOnBoardedAtSignUseCase>(),
      get<_i15.OnBoardDataWhenSuccessfulUseCase>(),
      get<_i16.AtContactInitializationUseCase>()));
  gh.factory<_i17.AtContactInitializationUseCase>(
      () => _i17.AtContactInitializationUseCase(get<_i6.IContactsFacade>()));
  gh.factory<_i18.GetOnBoardedAtSignUseCase>(
      () => _i18.GetOnBoardedAtSignUseCase(get<_i4.IAtsignOnBoardingFacade>()));
  return get;
}
