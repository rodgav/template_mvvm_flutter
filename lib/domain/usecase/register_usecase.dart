import 'package:template_mvvm_flutter/data/network/failure.dart';
import 'package:template_mvvm_flutter/data/request/test.dart';
import 'package:template_mvvm_flutter/domain/model/test.dart';
import 'package:template_mvvm_flutter/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import 'base_usecase.dart';

class RegisterUseCase
    implements
        BaseUseCase<TestRequest, Test>,
        RegisterUseCaseLogin<TestRequest, Test> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Test>> execute(TestRequest input) =>
      _repository.register(input);

  @override
  Future<Either<Failure, Test>> login(TestRequest input) =>
      _repository.login(input);
}

abstract class RegisterUseCaseLogin<In, Out> {
  Future<Either<Failure, Out>> login(In input);
}
