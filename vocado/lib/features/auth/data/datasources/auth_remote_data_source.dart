import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseAuthRemoteDataSource {
  Future<bool> getAuth({required String email, required String password});
}

@LazySingleton(as: BaseAuthRemoteDataSource)
class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final SupabaseClient _supabase;
  AuthRemoteDataSource(this._supabase);

  @override
  Future<bool> getAuth({
    required String email,
    required String password,
  }) async {
    try {
      await _supabase.auth.signInWithPassword(password: password, email: email);
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
