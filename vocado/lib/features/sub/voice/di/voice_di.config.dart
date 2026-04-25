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
import 'package:vocado/core/network/dio_client.dart' as _i856;
import 'package:vocado/core/services/voice_service.dart' as _i231;
import 'package:vocado/features/sub/voice/data/datasources/voice_remote_data_source.dart'
    as _i340;
import 'package:vocado/features/sub/voice/data/repositories/voice_repository_data.dart'
    as _i554;
import 'package:vocado/features/sub/voice/domain/repositories/voice_repository_domain.dart'
    as _i733;
import 'package:vocado/features/sub/voice/domain/use_cases/voice_use_case.dart'
    as _i335;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initVoiceSub({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i340.BaseVoiceRemoteDataSource>(
      () => _i340.VoiceRemoteDataSource(
        gh<_i231.VoiceService>(),
        gh<_i856.DioClient>(),
      ),
    );
    gh.lazySingleton<_i733.VoiceRepositoryDomain>(
      () => _i554.VoiceRepositoryData(gh<_i340.BaseVoiceRemoteDataSource>()),
    );
    gh.lazySingleton<_i335.VoiceUseCase>(
      () => _i335.VoiceUseCase(gh<_i733.VoiceRepositoryDomain>()),
    );
    return this;
  }
}
