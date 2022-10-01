import 'package:template_mvvm_flutter/data/network/failure.dart';
import 'package:template_mvvm_flutter/data/request/test.dart';
import 'package:template_mvvm_flutter/domain/model/test.dart';
import 'package:template_mvvm_flutter/domain/repository/repository.dart';
import 'package:template_mvvm_flutter/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class MainUseCase implements BaseUseCase<TestRequest, Test> {
  final Repository _repository;

  MainUseCase(this._repository);

  @override
  Future<Either<Failure, Test>> execute(TestRequest input) =>
      _repository.deleteSession(input);
}
