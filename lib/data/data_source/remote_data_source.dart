import 'dart:html';

import 'package:clean_architecture/data/network/app_api.dart';
import 'package:clean_architecture/data/network/recuests.dart';
import 'package:clean_architecture/data/responce/responses.dart';
import 'package:clean_architecture/domain/models/models.dart';

abstract class RemoteDataSource {
  // for call apis
  Future<AuthenticationResponse> login(LoginRequest LoginRequest);
}

class RemoteDatasourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDatasourceImpl(
    this._appServiceClient,
  );

  @override
  Future<AuthenticationResponse> login(LoginRequest LoginRequest) async {
    return await _appServiceClient.login(
        LoginRequest.email, LoginRequest.password);
  }
}
