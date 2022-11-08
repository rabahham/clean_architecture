import 'package:clean_architecture/data/network/failure.dart';
import 'package:clean_architecture/data/network/recuests.dart';
import 'package:clean_architecture/domain/models/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
