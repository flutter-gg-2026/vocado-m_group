// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:vocado/core/services/local_keys_service.dart' as _i140;
import 'package:vocado/features/main_nav/data/datasources/main_nav_remote_data_source.dart'
    as _i284;
import 'package:vocado/features/main_nav/data/repositories/main_nav_repository_data.dart'
    as _i978;
import 'package:vocado/features/main_nav/domain/repositories/main_nav_repository_domain.dart'
    as _i141;
import 'package:vocado/features/main_nav/domain/use_cases/main_nav_use_case.dart'
    as _i1020;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initMainNav({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i284.BaseMainNavRemoteDataSource>(
      () => _i284.MainNavRemoteDataSource(
        gh<_i140.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i141.MainNavRepositoryDomain>(
      () =>
          _i978.MainNavRepositoryData(gh<_i284.BaseMainNavRemoteDataSource>()),
    );
    gh.lazySingleton<_i1020.MainNavUseCase>(
      () => _i1020.MainNavUseCase(gh<_i141.MainNavRepositoryDomain>()),
    );
    return this;
  }
}
