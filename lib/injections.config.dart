// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:at_location_flutter/map_content/flutter_map/src/map/map.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/location/bloc/location_bloc.dart' as _i11;
import 'application/on_boarding/bloc/on_boarding_bloc.dart' as _i14;
import 'domain/contacts/i_contacts_facade.dart' as _i5;
import 'domain/contacts/use_cases/at_contact_initialization_use_case.dart'
    as _i17;
import 'domain/contacts/use_cases/at_contacts_use_cases.dart' as _i16;
import 'domain/location/i_location_facade.dart' as _i7;
import 'domain/location/use_cases/init_location_services_use_case.dart' as _i9;
import 'domain/on_boarding/i_atsign_on_boarding_facade.dart' as _i3;
import 'domain/on_boarding/use_cases/get_on_boarded_at_sign_use_case.dart'
    as _i18;
import 'domain/on_boarding/use_cases/load_client_prefs_use_case.dart' as _i10;
import 'domain/on_boarding/use_cases/on_board_data_when_succesful_use_case.dart'
    as _i13;
import 'domain/on_boarding/use_cases/on_boarding_use_cases.dart' as _i15;
import 'infrastructure/contacts/contacts_facade.dart' as _i6;
import 'infrastructure/location/location_facade.dart' as _i8;
import 'infrastructure/on_boarding/onboarding_atsign_facade.dart' as _i4;
import 'presentation/location/third_part_modules.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final yourModuleName = _$YourModuleName();
  gh.lazySingleton<_i3.IAtsignOnBoardingFacade>(
      () => _i4.OnboardingAtsignFacade());
  gh.lazySingleton<_i5.IContactsFacade>(() => _i6.ContactsFacade());
  gh.lazySingleton<_i7.ILocationFacade>(() => _i8.LocationFacade());
  gh.factory<_i9.InitLocationServicesUseCase>(
      () => _i9.InitLocationServicesUseCase(get<_i7.ILocationFacade>()));
  gh.factory<_i10.LoadAtClientPreferenceUseCase>(() =>
      _i10.LoadAtClientPreferenceUseCase(get<_i3.IAtsignOnBoardingFacade>()));
  gh.factory<_i11.LocationBloc>(() => _i11.LocationBloc(
      get<_i9.InitLocationServicesUseCase>(), get<_i7.ILocationFacade>()));
  gh.singleton<_i12.MapControllerImpl>(yourModuleName.mapController);
  gh.factory<_i13.OnBoardDataWhenSuccessfulUseCase>(() =>
      _i13.OnBoardDataWhenSuccessfulUseCase(
          get<_i3.IAtsignOnBoardingFacade>()));
  gh.factory<_i14.OnBoardingBloc>(() => _i14.OnBoardingBloc(
      get<_i15.LoadAtClientPreferenceUseCase>(),
      get<_i15.GetOnBoardedAtSignUseCase>(),
      get<_i15.OnBoardDataWhenSuccessfulUseCase>(),
      get<_i16.AtContactInitializationUseCase>()));
  gh.factory<_i17.AtContactInitializationUseCase>(
      () => _i17.AtContactInitializationUseCase(get<_i5.IContactsFacade>()));
  gh.factory<_i18.GetOnBoardedAtSignUseCase>(
      () => _i18.GetOnBoardedAtSignUseCase(get<_i3.IAtsignOnBoardingFacade>()));
  return get;
}

class _$YourModuleName extends _i19.YourModuleName {}
