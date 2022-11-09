import 'package:dartz/dartz.dart';

import 'package:clean_architecture/domain/models/models.dart';

import 'package:clean_architecture/data/network/recuests.dart';

import 'package:clean_architecture/data/network/failure.dart';

import '../../domain/repositry/repository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl();

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
