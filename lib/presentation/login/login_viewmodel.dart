import 'package:template_mvvm_flutter/app/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:template_mvvm_flutter/app/functions.dart';
import 'package:template_mvvm_flutter/data/request/test.dart';
import 'package:template_mvvm_flutter/domain/usecase/login_usecase.dart';
import 'package:template_mvvm_flutter/presentation/base/base_viewmodel.dart';
import 'package:template_mvvm_flutter/presentation/common/freezed_data_classes.dart';
import 'package:template_mvvm_flutter/presentation/common/state_render/state_render.dart';
import 'package:template_mvvm_flutter/presentation/common/state_render/state_render_impl.dart';
import 'package:template_mvvm_flutter/presentation/resources/strings_manager.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutput {
  final LoginUseCase _loginUsecase;
  final AppPreferences _appPreferences;

  LoginViewModel(this._loginUsecase, this._appPreferences);

  final _emailStreCtrl = BehaviorSubject<String>();
  final _passwordStreCtrl = BehaviorSubject<String>();
  final _inputsStreCtrl = BehaviorSubject<void>();

  LoginObject _loginObject = LoginObject('', '', '');

  @override
  Sink get inputInputsValid => _inputsStreCtrl.sink;

  @override
  Sink get inputPassword => _passwordStreCtrl.sink;

  @override
  Sink get inputEmail => _emailStreCtrl.sink;

  @override
  login(BuildContext context,VoidCallback goMain) async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState,
        message: AppStrings.empty));
    (await _loginUsecase.execute(TestRequest(_loginObject.username)))
        .fold((f) {
      inputState
          .add(ErrorState(StateRendererType.fullScreenErrorState, f.message));
    }, (r)  async {
      await _appPreferences.setToken(r.toString());
      goMain.call();
    });
  }

  @override
  Stream<bool> get outputEmailValid => _emailStreCtrl.stream.map(isEmailValid);

  @override
  Stream<bool> get outputInputValid =>
      _inputsStreCtrl.stream.map((_) => _inputsValid());

  @override
  Stream<bool> get outputPasswordValid =>
      _passwordStreCtrl.stream.map(isPasswordValid);

  @override
  setEmail(String email) {
    inputEmail.add(email);
    _loginObject = _loginObject.copyWith(username: email);
    _validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    _loginObject = _loginObject.copyWith(password: password);
    _validate();
  }

  @override
  void dispose() {
    _emailStreCtrl.close();
    _passwordStreCtrl.close();
    _inputsStreCtrl.close();
    super.dispose();
  }

  _validate() {
    inputInputsValid.add(null);
  }

  bool _inputsValid() {
    return isEmailValid(_loginObject.username) &&
        isPasswordValid(_loginObject.password);
  }
}

abstract class LoginViewModelInput {
  setEmail(String email);

  setPassword(String password);

  login(BuildContext context,VoidCallback goMain);

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputInputsValid;
}

abstract class LoginViewModelOutput {
  Stream<bool> get outputEmailValid;

  Stream<bool> get outputPasswordValid;

  Stream<bool> get outputInputValid;
}
