import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';

abstract class AuthRepositoryDomain {
    Future<Result<bool, Failure>> getAuth({required String email, required String password});
}
