
import 'package:dio/dio.dart';
import 'package:template_mvvm_flutter/data/network/failure.dart';
import 'package:template_mvvm_flutter/intl/generated/l10n.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  unknow,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaulT
}

class ErrorHandler {
  late Failure failure;

  ErrorHandler.handle(dynamic error,S s) {
    if (error is DioError) {
      failure = _handleError(error,s);
    } else {
      failure = DataSource.defaulT.getFailure(s);
    }
  }

  Failure _handleError(DioError dioError,S s) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return DataSource.connectTimeout.getFailure(s);
      case DioErrorType.sendTimeout:
        return DataSource.sendTimeout.getFailure(s);
      case DioErrorType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure(s);
      case DioErrorType.response:
        switch (dioError.response?.statusCode) {
          case ResponseCode.badRequest:
            return DataSource.badRequest.getFailure(s);
          case ResponseCode.forbidden:
            return DataSource.forbidden.getFailure(s);
          case ResponseCode.unauthorized:
            return DataSource.unauthorized.getFailure(s);
          case ResponseCode.notFound:
            return DataSource.notFound.getFailure(s);
          case ResponseCode.internalServerError:
            return DataSource.internalServerError.getFailure(s);
          default:
            return DataSource.defaulT.getFailure(s);
        }
      case DioErrorType.cancel:
        return DataSource.cancel.getFailure(s);
      case DioErrorType.other:
        return DataSource.defaulT.getFailure(s);
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure(S s) {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, s.bad_request_error);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, s.forbidden_error);
      case DataSource.unauthorized:
        return Failure(ResponseCode.unauthorized, s.unauthorized_error);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, s.not_found_error);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            s.internal_server_error);
      case DataSource.connectTimeout:
        return Failure(
            ResponseCode.connectTimeout, s.timeout_error);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, s.default_error);
      case DataSource.receiveTimeout:
        return Failure(
            ResponseCode.receiveTimeout, s.timeout_error);
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, s.timeout_error);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, s.cache_error);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            s.no_internet_error);
      case DataSource.defaulT:
        return Failure(ResponseCode.defaulT, s.default_error);
      default:
        return Failure(ResponseCode.defaulT, s.default_error);
    }
  }
}

class ResponseCode {
  //api status code
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unauthorized = 401;
  static const int notFound = 404;
  static const int internalServerError = 500;

  //local status code
  static const int defaulT = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ApiInternalResponse {
  static const int succes = 0;
  static const int failure = 1;
}
