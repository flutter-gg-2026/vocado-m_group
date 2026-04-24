import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseSignUpRemoteDataSource {
  Future<bool> getSignUp({
    required String name,
    required String email,
    required String password,
  });
}

@LazySingleton(as: BaseSignUpRemoteDataSource)
class SignUpRemoteDataSource implements BaseSignUpRemoteDataSource {
  final SupabaseClient _supabase;

  SignUpRemoteDataSource(this._supabase);

  @override
  Future<bool> getSignUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final user = await _supabase.auth.signUp(password: password, email: email);
    final role = await _supabase
        .from("roles")
        .select()
        .eq("name", 'member')
        .single();

    Map<String, dynamic> data = {
      "id": user.user!.id,
      "auth_id": user.user!.id,
      "name": name,
      "email": email,
      "role": role["id"],
    };

    await _supabase.from("users").insert(data);

    try {
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
