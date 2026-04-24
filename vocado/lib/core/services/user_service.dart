import 'package:injectable/injectable.dart';
import 'package:vocado/core/common/models/user_model.dart';

@lazySingleton
class UserService {
  UserModel? _user;

  UserModel get getUser {
    return _user!;
  }

  set setUser(UserModel user) {
    _user = user;
  }
}
