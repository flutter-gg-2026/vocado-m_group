import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/sign_up/domain/repositories/sign_up_repository_domain.dart';


@lazySingleton
class SignUpUseCase {
  final SignUpRepositoryDomain _repositoryData;

  SignUpUseCase(this._repositoryData);

   Future<Result<bool, Failure>> getSignUp({required String name,required String email,required String password}) async {
    return _repositoryData.getSignUp(email: email,name: name,password: password);
  }
}
