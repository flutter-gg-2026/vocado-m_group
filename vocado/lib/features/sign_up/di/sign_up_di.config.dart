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
import 'package:vocado/features/sign_up/data/datasources/sign_up_remote_data_source.dart'
    as _i142;
import 'package:vocado/features/sign_up/data/repositories/sign_up_repository_data.dart'
    as _i489;
import 'package:vocado/features/sign_up/domain/repositories/sign_up_repository_domain.dart'
    as _i261;
import 'package:vocado/features/sign_up/domain/use_cases/sign_up_use_case.dart'
    as _i160;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initSignUp({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i142.BaseSignUpRemoteDataSource>(
      () => _i142.SignUpRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i261.SignUpRepositoryDomain>(
      () => _i489.SignUpRepositoryData(gh<_i142.BaseSignUpRemoteDataSource>()),
    );
    gh.lazySingleton<_i160.SignUpUseCase>(
      () => _i160.SignUpUseCase(gh<_i261.SignUpRepositoryDomain>()),
    );
    return this;
  }
}
