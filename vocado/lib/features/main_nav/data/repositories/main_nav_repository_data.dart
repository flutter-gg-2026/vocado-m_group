
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/main_nav/domain/entities/main_nav_entity.dart';

import 'package:vocado/features/main_nav/data/datasources/main_nav_remote_data_source.dart';
import 'package:vocado/features/main_nav/data/models/main_nav_model.dart';
import 'package:vocado/features/main_nav/domain/repositories/main_nav_repository_domain.dart';

@LazySingleton(as: MainNavRepositoryDomain)
class MainNavRepositoryData implements MainNavRepositoryDomain{
  final BaseMainNavRemoteDataSource remoteDataSource;


  MainNavRepositoryData(this.remoteDataSource);

@override
  Future<Result<MainNavEntity, Failure>> getMainNav() async {
    try {
      final response = await remoteDataSource.getMainNav();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
