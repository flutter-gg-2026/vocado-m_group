import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/features/main_nav/data/models/main_nav_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseMainNavRemoteDataSource {
  Future<MainNavModel> getMainNav();
}

@LazySingleton(as: BaseMainNavRemoteDataSource)
class MainNavRemoteDataSource implements BaseMainNavRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  MainNavRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<MainNavModel> getMainNav() async {
    try {
      return MainNavModel(
        id: 1,
        firstName: "Last Name",
        lastName: "First Name",
      );
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
