// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/location/bloc/location_bloc.dart' as _i22;
import 'application/on_boarding/bloc/on_boarding_bloc.dart' as _i15;
import 'application/side_drawer/cubit/drawer_cubit.dart' as _i23;
import 'domain/contacts/i_contacts_facade.dart' as _i8;
import 'domain/contacts/use_cases/at_contact_initialization_use_case.dart'
    as _i18;
import 'domain/contacts/use_cases/at_contacts_use_cases.dart' as _i17;
import 'domain/contacts/use_cases/get_active_atsign_use_case.dart' as _i19;
import 'domain/events/i_events_facade.dart' as _i5;
import 'domain/events/use_cases/get_events_stream_use_case.dart' as _i4;
import 'domain/location/i_location_facade.dart' as _i10;
import 'domain/location/use_cases/get_device_location_use_case.dart' as _i20;
import 'domain/location/use_cases/init_location_services_use_case.dart' as _i12;
import 'domain/on_boarding/i_atsign_on_boarding_facade.dart' as _i6;
import 'domain/on_boarding/use_cases/get_on_boarded_at_sign_use_case.dart'
    as _i21;
import 'domain/on_boarding/use_cases/load_client_prefs_use_case.dart' as _i13;
import 'domain/on_boarding/use_cases/on_board_data_when_succesful_use_case.dart'
    as _i14;
import 'domain/on_boarding/use_cases/on_boarding_use_cases.dart' as _i16;
import 'infrastructure/contacts/contacts_facade.dart' as _i9;
import 'infrastructure/location/location_facade.dart' as _i11;
import 'infrastructure/on_boarding/onboarding_atsign_facade.dart' as _i7;
import 'presentation/routes/router.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.$Router>(_i3.$Router());
  gh.factory<_i4.GetEventsStreamUseCase>(
      () => _i4.GetEventsStreamUseCase(get<_i5.IEventsFacade>()));
  gh.lazySingleton<_i6.IAtsignOnBoardingFacade>(
      () => _i7.OnboardingAtsignFacade());
  gh.lazySingleton<_i8.IContactsFacade>(() => _i9.ContactsFacade());
  gh.lazySingleton<_i10.ILocationFacade>(() => _i11.LocationFacade());
  gh.factory<_i12.InitLocationServicesUseCase>(
      () => _i12.InitLocationServicesUseCase(get<_i10.ILocationFacade>()));
  gh.factory<_i13.LoadAtClientPreferenceUseCase>(() =>
      _i13.LoadAtClientPreferenceUseCase(get<_i6.IAtsignOnBoardingFacade>()));
  gh.factory<_i14.OnBoardDataWhenSuccessfulUseCase>(() =>
      _i14.OnBoardDataWhenSuccessfulUseCase(
          get<_i6.IAtsignOnBoardingFacade>()));
  gh.factory<_i15.OnBoardingBloc>(() => _i15.OnBoardingBloc(
      get<_i16.LoadAtClientPreferenceUseCase>(),
      get<_i16.GetOnBoardedAtSignUseCase>(),
      get<_i16.OnBoardDataWhenSuccessfulUseCase>(),
      get<_i17.AtContactInitializationUseCase>()));
  gh.factory<_i18.AtContactInitializationUseCase>(
      () => _i18.AtContactInitializationUseCase(get<_i8.IContactsFacade>()));
  gh.factory<_i19.GetActiveAtsignUseCase>(
      () => _i19.GetActiveAtsignUseCase(get<_i8.IContactsFacade>()));
  gh.factory<_i20.GetLocationStatusUseCase>(
      () => _i20.GetLocationStatusUseCase(get<_i10.ILocationFacade>()));
  gh.factory<_i21.GetOnBoardedAtSignUseCase>(
      () => _i21.GetOnBoardedAtSignUseCase(get<_i6.IAtsignOnBoardingFacade>()));
  gh.factory<_i22.LocationBloc>(() => _i22.LocationBloc(
      get<_i12.InitLocationServicesUseCase>(),
      get<_i10.ILocationFacade>(),
      get<_i20.GetLocationStatusUseCase>()));
  gh.factory<_i23.DrawerCubit>(
      () => _i23.DrawerCubit(get<_i19.GetActiveAtsignUseCase>()));
  return get;
}
