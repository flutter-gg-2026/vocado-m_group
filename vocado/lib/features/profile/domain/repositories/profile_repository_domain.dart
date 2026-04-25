import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepositoryDomain {
  Future<Result<ProfileEntity, Failure>> getProfile();
  Future<Result<bool, Failure>> signOut();
}
