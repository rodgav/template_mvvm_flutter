import 'dart:typed_data';

import 'package:template_mvvm_flutter/data/network/app_api.dart';
import 'package:template_mvvm_flutter/data/request/test.dart';
import 'package:template_mvvm_flutter/domain/model/test.dart';

abstract class RemoteDataSource {
  Future<Test> login(TestRequest testRequest);

  Future<Test> register(TestRequest testRequest);

  Future<Test> forgotPassword(TestRequest testRequest);

  Future<Test> forgotPasswordConfirmation(
      TestRequest testRequest);

  Future<Test> deleteSession(TestRequest testRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<Test> login(TestRequest testRequest) =>
      _appServiceClient.login(testRequest);

  @override
  Future<Test> register(TestRequest testRequest) =>
      _appServiceClient.register(testRequest);

  @override
  Future<Test> forgotPassword(TestRequest testRequest) =>
      _appServiceClient.forgotPassword(testRequest);

  @override
  Future<Test> forgotPasswordConfirmation(TestRequest testRequest) =>
      _appServiceClient.forgotPasswordConfirmation(testRequest);

  @override
  Future<Test> deleteSession(TestRequest testRequest) =>
      _appServiceClient.deleteSession(testRequest);
}
