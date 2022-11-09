import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetWorkInfo {
  Future<bool> get inConnected;
}

class NetworkInfoImpl implements NetWorkInfo {
  final InternetConnectionChecker _internetConnectionChecker;
  NetworkInfoImpl(this._internetConnectionChecker);
  @override
  Future<bool> get inConnected => _internetConnectionChecker.hasConnection;
}
