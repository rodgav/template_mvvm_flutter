import 'dart:typed_data';

import 'package:template_mvvm_flutter/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:template_mvvm_flutter/data/request/test.dart';
import 'package:template_mvvm_flutter/domain/model/test.dart';

abstract class Repository {
  Future<Either<Failure, Test>> login(TestRequest testRequest);

  Future<Either<Failure, Test>> register(TestRequest testRequest);

  Future<Either<Failure, Test>> forgotPassword(TestRequest testRequest);

  Future<Either<Failure, Test>> forgotPasswordConfirmation(
      TestRequest testRequest);

  Future<Either<Failure, Test>> deleteSession(TestRequest testRequest);
}
