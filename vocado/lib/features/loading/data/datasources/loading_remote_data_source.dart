import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/common/models/user_model.dart';
import 'package:vocado/core/services/user_service.dart';
import 'package:vocado/features/loading/data/models/loading_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseLoadingRemoteDataSource {
  Future<LoadingModel> getLogin();
}

@LazySingleton(as: BaseLoadingRemoteDataSource)
class LoadingRemoteDataSource implements BaseLoadingRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;
  LoadingRemoteDataSource(this._supabase, this._userService);

  @override
  Future<LoadingModel> getLogin() async {
    try {
      final userToken = _supabase.auth.currentSession?.accessToken;
      bool isUser = userToken != null;
      final expire = _supabase.auth.currentSession?.isExpired ?? true;

      if (isUser && !expire) {
        final user = await _supabase
            .from("users")
            .select()
            .eq("id", _supabase.auth.currentUser!.id)
            .single();
        final role = await _supabase
            .from("roles")
            .select()
            .eq("id", user['role'])
            .single();

        final UserModel userModel = UserModel.fromJson(user);
        _userService.setUser = userModel;
        return LoadingModel(isLogging: true, role: role['name']);
      } else {
        return LoadingModel(isLogging: false, role: null);
      }
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
