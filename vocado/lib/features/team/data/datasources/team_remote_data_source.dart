import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/utils/formatters.dart';
import 'package:vocado/features/team/data/models/member_model.dart';
import 'package:vocado/features/team/data/models/team_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseTeamRemoteDataSource {
  Future<List<TeamModel>> getTeam();
  Future<List<MemberModel>> getAllMember();
  Future<bool> addMember({
    required String id,
    required String name,
    required String role,
  });
}

@LazySingleton(as: BaseTeamRemoteDataSource)
class TeamRemoteDataSource implements BaseTeamRemoteDataSource {
  final SupabaseClient _supabase;

  TeamRemoteDataSource(this._supabase);

  @override
  Future<List<TeamModel>> getTeam() async {
    try {
      final team = await _supabase
          .from('teams')
          .select("*, users(name) , teams_members(name,role)")
          .eq("teamlead_id", _supabase.auth.currentUser!.id);

      return team.map((item) => TeamModel.fromJson(item)).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<List<MemberModel>> getAllMember() async {
    try {

      final role = await _supabase
          .from('roles')
          .select('id')
          .eq('name', 'member')
          .single();

      final teams = await _supabase.from("teams_members").select("user_id");
      final teamIds = (teams as List)
          .map((e) => e['user_id'] as String)
          .toList();

      final members = await _supabase
          .from('users')
          .select("id , name , roles(name)")
          .eq('role', role['id'])
          .not('id', 'in', teamIds);

      return members.map((item) => MemberModel.fromJson(item)).toList();
    } catch (error) {
     
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<bool> addMember({
    required String id,
    required String name,
    required String role,
  }) async {
    try {
      final teamLead = await _supabase
          .from("teams")
          .select("id")
          .eq("teamlead_id", _supabase.auth.currentUser!.id)
          .single();

      final date = Formatters.formatDateTime(DateTime.now());

      Map<String, dynamic> data = {
        "team_id": teamLead['id'],
        "user_id": id,
        "name": name,
        "role": role,
        "created_at": date,
      };

      await _supabase.from("teams_members").insert(data);
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
