import 'package:dio/dio.dart';
import 'package:template_mvvm_flutter/data/request/test.dart';
import 'package:template_mvvm_flutter/data/response/test.dart';
import 'package:template_mvvm_flutter/domain/model/test.dart';

class AppServiceClient {
  final Dio _dio;

  AppServiceClient(this._dio);

  Future<Test> login(TestRequest testRequest) async {
    final response = await _dio.post('/login',
        data: {'email': testRequest.test, 'password': testRequest.test});
    return testFromJson(response.data);
  }

  Future<Test> register(TestRequest testRequest) async {
    final response = await _dio.post('/register',
        data: {'email': testRequest.test, 'password': testRequest.test});
    return testFromJson(response.data);
  }

  Future<Test> forgotPassword(TestRequest testRequest) async {
    final response = await _dio.post('/forgotPassword',
        data: {'email': testRequest.test, 'password': testRequest.test});
    return testFromJson(response.data);
  }

  Future<Test> forgotPasswordConfirmation(TestRequest testRequest) async {
    final response = await _dio.post('/forgotPasswordConfirmation',
        data: {'email': testRequest.test, 'password': testRequest.test});
    return testFromJson(response.data);
  }

  Future<Test> deleteSession(TestRequest testRequest) async {
    final response = await _dio.post('/deleteSession',
        data: {'email': testRequest.test, 'password': testRequest.test});
    return testFromJson(response.data);
  }
}
