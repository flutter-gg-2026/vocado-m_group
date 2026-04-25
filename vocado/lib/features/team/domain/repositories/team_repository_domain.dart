import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/team/domain/entities/member_entity.dart';
import 'package:vocado/features/team/domain/entities/team_entity.dart';

abstract class TeamRepositoryDomain {
    Future<Result<List<TeamEntity>, Failure>> getTeam();
    Future<Result<List<MemberEntity>, Failure>> getAllMember();
    Future<Result<bool, Failure>> addMember({required String id, required String name, required String role});
}
