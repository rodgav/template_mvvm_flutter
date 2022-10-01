import 'package:template_mvvm_flutter/data/network/error_handler.dart';
import 'package:template_mvvm_flutter/data/request/test.dart';
import 'package:template_mvvm_flutter/domain/model/test.dart';
import 'package:template_mvvm_flutter/intl/generated/l10n.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'package:template_mvvm_flutter/data/data_source/local_data_source.dart';
import 'package:template_mvvm_flutter/data/data_source/remote_data_source.dart';
import 'package:template_mvvm_flutter/data/network/failure.dart';
import 'package:template_mvvm_flutter/data/network/network_info.dart';
import 'package:template_mvvm_flutter/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo? _networkInfo;
  final S _s;

  RepositoryImpl(this._remoteDataSource, this._localDataSource,
      this._networkInfo, this._s);

  @override
  Future<Either<Failure, Test>> login(TestRequest testRequest) async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final response = await _remoteDataSource.login(testRequest);
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error, _s).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure(_s));
    }
  }

  @override
  Future<Either<Failure, Test>> register(TestRequest testRequest) async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final response = await _remoteDataSource.register(testRequest);
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error, _s).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure(_s));
    }
  }

  @override
  Future<Either<Failure, Test>> forgotPassword(TestRequest testRequest) async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final response = await _remoteDataSource.forgotPassword(testRequest);
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error, _s).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure(_s));
    }
  }

  @override
  Future<Either<Failure, Test>> forgotPasswordConfirmation(
      TestRequest testRequest) async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final response =
            await _remoteDataSource.forgotPasswordConfirmation(testRequest);
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error, _s).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure(_s));
    }
  }

  @override
  Future<Either<Failure, Test>> deleteSession(TestRequest testRequest) async {
    if (kIsWeb ? true : (await _networkInfo?.isConnected ?? false)) {
      try {
        final res = await _remoteDataSource.deleteSession(testRequest);
        return Right(res);
      } catch (error) {
        return Left(ErrorHandler.handle(error, _s).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure(_s));
    }
  }
}
