import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/common/entities/user_entity.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/profile/domain/repositories/profile_repository_domain.dart';

@lazySingleton
class ProfileUseCase {
  final ProfileRepositoryDomain _repositoryData;

  ProfileUseCase(this._repositoryData);

  Future<Result<UserEntity, Failure>> getProfile() async {
    return _repositoryData.getProfile();
  }

  Future<Result<bool, Failure>> signOut() async {
    return _repositoryData.signOut();
  }
}
