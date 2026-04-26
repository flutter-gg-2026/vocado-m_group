import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/common/entities/user_entity.dart';
import 'package:vocado/core/errors/failure.dart';

abstract class ProfileRepositoryDomain {
  Future<Result<UserEntity, Failure>> getProfile();
  Future<Result<bool, Failure>> signOut();
}
