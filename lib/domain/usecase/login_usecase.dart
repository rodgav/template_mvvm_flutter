import 'package:template_mvvm_flutter/data/network/failure.dart';
import 'package:template_mvvm_flutter/data/request/test.dart';
import 'package:template_mvvm_flutter/domain/model/test.dart';
import 'package:template_mvvm_flutter/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import 'base_usecase.dart';

class LoginUseCase implements BaseUseCase<TestRequest, Test> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Test>> execute(TestRequest input) =>
      _repository.login(input);
}

