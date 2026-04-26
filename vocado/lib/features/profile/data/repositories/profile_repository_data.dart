
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/common/entities/user_entity.dart';
import 'package:vocado/core/common/models/user_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:vocado/features/profile/domain/repositories/profile_repository_domain.dart';

@LazySingleton(as: ProfileRepositoryDomain)
class ProfileRepositoryData implements ProfileRepositoryDomain{
  final BaseProfileRemoteDataSource remoteDataSource;
  ProfileRepositoryData(this.remoteDataSource);

@override
  Future<Result<UserEntity, Failure>> getProfile() async {
    try {
      final response = await remoteDataSource.getProfile();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

   @override
  Future<Result<bool, Failure>> signOut() async {
    try {
      final response = await remoteDataSource.signOut();
      return Success(response);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
