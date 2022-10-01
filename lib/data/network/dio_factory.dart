import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:template_mvvm_flutter/app/app_preferences.dart';
import 'package:template_mvvm_flutter/app/constants.dart';
import 'package:dio_logger/dio_logger.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
const String authorization = 'authorization';
const String defaultLanguage = 'language';

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    int timeOut = 60 * 1000;
    String language = _appPreferences.getLocale().toString();
    String token = _appPreferences.getToken();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: token,
      defaultLanguage: language
    };
    dio.options = BaseOptions(
        baseUrl: Constant.baseUrl,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        headers: headers);

    if (!kReleaseMode) dio.interceptors.add(dioLoggerInterceptor);

    return dio;
  }
}
