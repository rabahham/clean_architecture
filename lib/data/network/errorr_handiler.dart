import 'package:clean_architecture/data/network/failure.dart';
import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its an error from response of the API or from dio itslef

      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.CONNET_TIMOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.RECIVE_TIMEOUT.getFailure();
    case DioErrorType.response:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
            code: error.response?.statusCode ?? 0,
            message: error.response?.statusMessage ?? "");
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioErrorType.other:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTET,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNET_TIMOUT,
  RECIVE_TIMEOUT,
  SEND_TIMOUT,
  CACHE_ERROR,
  CANCEL,
  NO_INTERNAT_CONECTION,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(
            code: ResponseCode.SUCCESS, message: ResponseMessage.SUCCESS);

      case DataSource.NO_CONTET:
        return Failure(
            code: ResponseCode.NO_CONTET, message: ResponseMessage.NO_CONTET);
      case DataSource.BAD_REQUEST:
        return Failure(
            code: ResponseCode.BAD_REQUEST,
            message: ResponseMessage.BAD_REQUEST);

      case DataSource.FORBIDDEN:
        return Failure(
            code: ResponseCode.FORBIDDEN, message: ResponseMessage.FORBIDDEN);

      case DataSource.UNAUTORISED:
        return Failure(
            code: ResponseCode.UNAUTORISED,
            message: ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return Failure(
            code: ResponseCode.NOT_FOUND, message: ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(
            code: ResponseCode.INTERNAL_SERVER_ERROR,
            message: ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNET_TIMOUT:
        return Failure(
            code: ResponseCode.CONNET_TIMOUT,
            message: ResponseMessage.CONNET_TIMOUT);
      case DataSource.RECIVE_TIMEOUT:
        return Failure(
            code: ResponseCode.RECIVE_TIMEOUT,
            message: ResponseMessage.RECIVE_TIMEOUT);
      case DataSource.SEND_TIMOUT:
        return Failure(
            code: ResponseCode.SEND_TIMOUT,
            message: ResponseMessage.SEND_TIMOUT);
      case DataSource.CACHE_ERROR:
        return Failure(
            code: ResponseCode.CACHE_ERROR,
            message: ResponseMessage.CACHE_ERROR);
      case DataSource.DEFAULT:
        return Failure(
            code: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT);
      case DataSource.NO_INTERNAT_CONECTION:
        return Failure(
            code: ResponseCode.NO_INTERNAT_CONECTION,
            message: ResponseMessage.NO_INTERNAT_CONECTION);
      case DataSource.CANCEL:
        return Failure(
            code: ResponseCode.CANCEL, message: ResponseMessage.CANCEL);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // succes with data
  static const int NO_CONTET = 201; // succcess with no data
  static const int BAD_REQUEST = 400; // fialure with API rejected request
  static const int UNAUTORISED = 401; // fialure , user is not authorised
  static const int FORBIDDEN = 403; // failure , API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status data

  static const int CONNET_TIMOUT = -1;
  static const int CANCEL = -2;
  static const int RECIVE_TIMEOUT = -3;
  static const int SEND_TIMOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNAT_CONECTION = -6;
  static const int DEFAULT = -6;
}

class ResponseMessage {
  static const String SUCCESS = "success"; // succes with data
  static const String NO_CONTET = "success"; // succcess with no data
  static const String BAD_REQUEST =
      "bad requist, Try again later "; // fialure with API rejected request
  static const String UNAUTORISED =
      "User is unauthoised,Try again later "; // fialure , user is not authorised
  static const String FORBIDDEN =
      "Forbidden is request,Try again later "; // failure , API rejected request
  static const String INTERNAL_SERVER_ERROR =
      "Some thing went wrong,Try again later "; // failure, crash in server side
  static const String NOT_FOUND =
      "Some thing went wrong,Try again later "; // failure, not found

  // local status data

  static const String CONNET_TIMOUT = "Time out error,Try again later ";
  static const String CANCEL = "Request was cancelled,Try again later ";
  static const String RECIVE_TIMEOUT = "Time out error,Try again later ";
  static const String SEND_TIMOUT = "Time out error,Try again later ";
  static const String CACHE_ERROR = "Cache error,Try again later ";
  static const String NO_INTERNAT_CONECTION =
      "Please check your internet connection ";
  static const String DEFAULT = "Some thing went wrong,Try again later ";
}
