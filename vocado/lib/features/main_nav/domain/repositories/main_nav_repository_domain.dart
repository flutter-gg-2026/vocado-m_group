import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/main_nav/domain/entities/main_nav_entity.dart';

abstract class MainNavRepositoryDomain {
    Future<Result<MainNavEntity, Failure>> getMainNav();
}
