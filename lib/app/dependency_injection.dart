import 'package:app_links/app_links.dart';
import 'package:template_mvvm_flutter/data/data_source/local_data_source.dart';
import 'package:template_mvvm_flutter/data/data_source/remote_data_source.dart';
import 'package:template_mvvm_flutter/data/network/app_api.dart';
import 'package:template_mvvm_flutter/data/network/dio_factory.dart';
import 'package:template_mvvm_flutter/data/network/network_info.dart';
import 'package:template_mvvm_flutter/data/repository/repository_impl.dart';
import 'package:template_mvvm_flutter/domain/repository/repository.dart';
import 'package:template_mvvm_flutter/domain/usecase/forg_pass_conf_usecase.dart';
import 'package:template_mvvm_flutter/domain/usecase/forgot_password_usecase.dart';
import 'package:template_mvvm_flutter/domain/usecase/login_usecase.dart';
import 'package:template_mvvm_flutter/domain/usecase/main_usecase.dart';
import 'package:template_mvvm_flutter/domain/usecase/register_usecase.dart';
import 'package:template_mvvm_flutter/intl/generated/l10n.dart';
import 'package:template_mvvm_flutter/presentation/common/dialog_render/dialog_render.dart';
import 'package:template_mvvm_flutter/presentation/forgot_password/forgot_password_viewmodel.dart';
import 'package:template_mvvm_flutter/presentation/forgot_password_confirmation/forgot_password_confirmation_viewmodel.dart';
import 'package:template_mvvm_flutter/presentation/login/login_viewmodel.dart';
import 'package:template_mvvm_flutter/presentation/main/main_viewmodel.dart';
import 'package:template_mvvm_flutter/presentation/register/register_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_preferences.dart';
import 'encrypt_helper.dart';

final instance = GetIt.instance;

Future<void> initModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<EncryptHelper>(() => EncryptHelper());
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance.registerLazySingleton<S>(() => S());
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance(), instance()));
  if (!kIsWeb) {
    instance.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImple(InternetConnectionChecker()));
  }
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  final client = await instance<DioFactory>().getDio();
  instance
      .registerLazySingleton<AppServiceClient>(() => AppServiceClient(client));
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(
      instance(), instance(), kIsWeb ? null : instance(), instance()));
  instance.registerLazySingleton<DialogRender>(() => DialogRenderImpl());
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  instance.registerLazySingleton<AppLinks>(() => AppLinks());
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance
        .registerLazySingleton<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerLazySingleton<LoginViewModel>(
        () => LoginViewModel(instance(), instance()));
  }
}

void initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(instance()));
    instance.registerLazySingleton<RegisterViewModel>(
        () => RegisterViewModel(instance(), instance()));
  }
}

void initForgotModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerLazySingleton<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));
    instance.registerLazySingleton<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}

void initForgPassConfModule() {
  if (!GetIt.I.isRegistered<ForgPassConfUseCase>()) {
    instance.registerLazySingleton<ForgPassConfUseCase>(
        () => ForgPassConfUseCase(instance()));
    instance.registerLazySingleton<ForgotPasswordConfirmationViewModel>(
        () => ForgotPasswordConfirmationViewModel(instance()));
  }
}

void initMainModule() {
  if (!GetIt.I.isRegistered<MainUseCase>()) {
    instance.registerLazySingleton<MainUseCase>(() => MainUseCase(instance()));
    instance.registerLazySingleton<MainViewModel>(
        () => MainViewModel(instance(), instance(), instance()));
  }
}
