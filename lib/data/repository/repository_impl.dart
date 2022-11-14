import 'package:clean_architecture/data/data_source/remote_data_source.dart';
import 'package:clean_architecture/data/mapper/mapper.dart';
import 'package:clean_architecture/data/network/errorr_handiler.dart';
import 'package:clean_architecture/data/network/network_info.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_architecture/domain/models/models.dart';

import 'package:clean_architecture/data/network/recuests.dart';

import 'package:clean_architecture/data/network/failure.dart';

import '../../domain/repositry/repository.dart';

class RepositoryImpl implements Repository {
  RemoteDataSource _remoteDataSource;
  NetWorkInfo _netWorkInfo;
  RepositoryImpl(this._remoteDataSource, this._netWorkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _netWorkInfo.isConnected) {
      // its connected to internet , its safe to call

      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response.toDomain());
        } else {
          // failure  -- buisiness error
          return Left(Failure(
              code: ApiInternalStatus.FAILURE,
              message: response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // entenet error
      return Left(DataSource.NO_INTERNAT_CONECTION.getFailure());
    }
  }
}
