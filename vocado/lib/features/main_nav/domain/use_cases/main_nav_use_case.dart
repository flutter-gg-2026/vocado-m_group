import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/main_nav/domain/entities/main_nav_entity.dart';
import 'package:vocado/features/main_nav/domain/repositories/main_nav_repository_domain.dart';


@lazySingleton
class MainNavUseCase {
  final MainNavRepositoryDomain _repositoryData;

  MainNavUseCase(this._repositoryData);

   Future<Result<MainNavEntity, Failure>> getMainNav() async {
    return _repositoryData.getMainNav();
  }
}
