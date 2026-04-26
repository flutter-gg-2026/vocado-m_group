import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/common/models/user_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseProfileRemoteDataSource {
  Future<UserModel> getProfile();
  Future<bool> signOut();
}

@LazySingleton(as: BaseProfileRemoteDataSource)
class ProfileRemoteDataSource implements BaseProfileRemoteDataSource {
  final SupabaseClient _supabase;

  ProfileRemoteDataSource(this._supabase);

  @override
  Future<UserModel> getProfile() async {
    try {
      final user = await _supabase
          .from('users')
          .select()
          .eq('id', _supabase.auth.currentUser!.id)
          .single();
      return UserModel.fromJson(user);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _supabase.auth.signOut();
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
