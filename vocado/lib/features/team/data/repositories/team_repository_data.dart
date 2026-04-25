import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/team/data/models/member_model.dart';
import 'package:vocado/features/team/data/models/team_model.dart';
import 'package:vocado/features/team/domain/entities/member_entity.dart';
import 'package:vocado/features/team/domain/entities/team_entity.dart';
import 'package:vocado/features/team/data/datasources/team_remote_data_source.dart';
import 'package:vocado/features/team/domain/repositories/team_repository_domain.dart';

@LazySingleton(as: TeamRepositoryDomain)
class TeamRepositoryData implements TeamRepositoryDomain {
  final BaseTeamRemoteDataSource remoteDataSource;

  TeamRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<TeamEntity>, Failure>> getTeam() async {
    try {
      final response = await remoteDataSource.getTeam();
      return Success(response.map((item) => item.toTeamEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<List<MemberEntity>, Failure>> getAllMember() async {
    try {
      final response = await remoteDataSource.getAllMember();
      return Success(response.map((item) => item.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<bool, Failure>> addMember({
    required String id,
    required String name,
    required String role,
  }) async {
    try {
      final response = await remoteDataSource.addMember(
        id: id,
        name: name,
        role: role,
      );
      return Success(response);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
