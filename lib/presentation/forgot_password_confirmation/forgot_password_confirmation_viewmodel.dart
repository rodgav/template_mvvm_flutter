import 'package:flutter/material.dart';
import 'package:template_mvvm_flutter/app/functions.dart';
import 'package:template_mvvm_flutter/data/request/test.dart';
import 'package:template_mvvm_flutter/domain/usecase/forg_pass_conf_usecase.dart';
import 'package:template_mvvm_flutter/presentation/base/base_viewmodel.dart';
import 'package:template_mvvm_flutter/presentation/common/state_render/state_render.dart';
import 'package:template_mvvm_flutter/presentation/common/state_render/state_render_impl.dart';
import 'package:template_mvvm_flutter/presentation/resources/strings_manager.dart';
import 'package:rxdart/rxdart.dart';

class ForgotPasswordConfirmationViewModel extends BaseViewModel
    with
        ForgotPasswordConfirmationViewModelInput,
        ForgotPasswordConfirmationViewModelOutput {
  final _passwordStreCtrl = BehaviorSubject<String>();
  final _passwordAgainStreCtrl = BehaviorSubject<String>();
  final _inputsValidateStreCtrl = BehaviorSubject<void>();
  String password = '';
  String passwordAgain = '';
  final ForgPassConfUseCase _forgPassConfUseCase;

  ForgotPasswordConfirmationViewModel(this._forgPassConfUseCase);

  @override
  void dispose() async {
    await _passwordStreCtrl.drain();
    _passwordStreCtrl.close();
    await _passwordAgainStreCtrl.drain();
    _passwordAgainStreCtrl.close();
    await _inputsValidateStreCtrl.drain();
    _inputsValidateStreCtrl.close();
    super.dispose();
  }

  @override
  forgotPasswordConfirmation(BuildContext context, String loading,
      String? userId, String? secret, VoidCallback goSplash) async {
    if (userId != null && secret != null) {
      inputState.add(LoadingState(
          stateRendererType: StateRendererType.fullScreenLoadingState,
          message: AppStrings.empty));
      (await _forgPassConfUseCase.execute(TestRequest(userId)))
          .fold(
              (l) => inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, l.message)), (r) {
        inputState.add(ContentState());
        goSplash.call();
      });
    } else {
      goSplash.call();
    }
  }

  @override
  Sink get inputInputsValidate => _inputsValidateStreCtrl.sink;

  @override
  Sink get inputPassword => _passwordStreCtrl.sink;

  @override
  Sink get inputPasswordAgain => _passwordAgainStreCtrl.sink;

  @override
  Stream<bool> get outputInputsValidate =>
      _inputsValidateStreCtrl.stream.map((_) => password == passwordAgain);

  @override
  Stream<bool> get outputPasswordValidate =>
      _passwordStreCtrl.stream.map(isPasswordValid);

  @override
  Stream<bool> get outputPasswordAgainValidate =>
      _passwordAgainStreCtrl.stream.map((_) => password == passwordAgain);

  @override
  setPassword(String password) {
    this.password = password;
    _validate();
  }

  @override
  setPasswordAgain(String passwordAgain) {
    this.passwordAgain = passwordAgain;
    _validate();
  }

  void _validate() {
    inputInputsValidate.add(null);
  }
}

abstract class ForgotPasswordConfirmationViewModelInput {
  setPassword(String password);

  setPasswordAgain(String passwordAgain);

  forgotPasswordConfirmation(BuildContext context, String loading,
      String? userId, String? secret, VoidCallback goSplash);

  Sink get inputPassword;

  Sink get inputPasswordAgain;

  Sink get inputInputsValidate;
}

abstract class ForgotPasswordConfirmationViewModelOutput {
  Stream<bool> get outputPasswordValidate;

  Stream<bool> get outputPasswordAgainValidate;

  Stream<bool> get outputInputsValidate;
}
