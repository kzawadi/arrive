// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/splash/on_boarding/bloc/on_boarding_bloc.dart' as _i6;
import 'domain/on_boarding/i_atsign_on_boarding.dart' as _i3;
import 'domain/on_boarding/use_cases/load_client_prefs_use_case.dart' as _i5;
import 'infrastructure/on_boarding/onboarding_atsign_facade.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IAtsignOnBoardingFacade>(
      () => _i4.OnboardingAtsignFacade());
  gh.factory<_i5.LoadAtClientPreference>(
      () => _i5.LoadAtClientPreference(get<_i3.IAtsignOnBoardingFacade>()));
  gh.factory<_i6.OnBoardingBloc>(
      () => _i6.OnBoardingBloc(get<_i5.LoadAtClientPreference>()));
  return get;
}
