import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:template_mvvm_flutter/app/dependency_injection.dart';
import 'package:template_mvvm_flutter/intl/generated/l10n.dart';
import 'package:template_mvvm_flutter/presentation/common/state_render/state_render_impl.dart';
import 'package:template_mvvm_flutter/presentation/forgot_password_confirmation/forgot_password_confirmation_viewmodel.dart';
import 'package:template_mvvm_flutter/presentation/global_widgets/responsive.dart';
import 'package:template_mvvm_flutter/presentation/resources/color_manager.dart';
import 'package:template_mvvm_flutter/presentation/resources/routes_manager.dart';
import 'package:template_mvvm_flutter/presentation/resources/values_manager.dart';

class ForgotPasswordConfirmation extends StatefulWidget {
  final String? userId, secret, expire;

  const ForgotPasswordConfirmation(this.userId, this.secret, this.expire,
      {Key? key})
      : super(key: key);

  @override
  State<ForgotPasswordConfirmation> createState() =>
      _ForgotPasswordConfirmationState();
}

class _ForgotPasswordConfirmationState
    extends State<ForgotPasswordConfirmation> {
  final _viewModel = instance<ForgotPasswordConfirmationViewModel>();
  final _s = instance<S>();
  final _passTextEditCtrl = TextEditingController();
  final _passAgaiTextEditCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _bind() {
    _viewModel.start();
    _passTextEditCtrl.addListener(
        () => _viewModel.setPassword(_passTextEditCtrl.text.trim()));
    _passAgaiTextEditCtrl.addListener(
        () => _viewModel.setPasswordAgain(_passAgaiTextEditCtrl.text.trim()));
    _passTextEditCtrl.text = '';
    _passAgaiTextEditCtrl.text = '';
  }

  @override
  void initState() {
    _bind();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.userId == null ||
          widget.secret == null ||
          widget.expire == null) {
        _goLogin();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _passTextEditCtrl.dispose();
    _passAgaiTextEditCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorManager.primary.withOpacity(0.7),
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) =>
              snapshot.data
                  ?.getScreenWidget(context, _getContentWidget(size), () {
                _closeApp();
              }, () {
                _viewModel.forgotPasswordConfirmation(
                    context, _s.loading, widget.userId, widget.secret, () {
                  _goLogin();
                });
              }) ??
              _getContentWidget(size)),
    );
  }

  Widget _getContentWidget(Size size) {
    return ResponsiveWid(
        smallScreen: _form(size.width * 0.8),
        largeScreen: _form(size.width * 0.5));
  }

  Widget _form(double width) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppSize.s10)),
        width: width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: AppSize.s20),
                  const SizedBox(
                      width: AppSize.s250,
                      height: AppSize.s140,
                      child: Placeholder()),
                  const SizedBox(height: AppSize.s40),
                  StreamBuilder<bool>(
                    stream: _viewModel.outputPasswordValidate,
                    builder: (context, snapshot) => TextFormField(
                      controller: _passTextEditCtrl,
                      decoration: InputDecoration(
                          labelText: _s.inputNewPassword,
                          hintText: _s.inputNewPassword,
                          errorMaxLines: 2,
                          errorText: (snapshot.data ?? true)
                              ? null
                              : _s.inputNewPasswordError),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: AppSize.s20),
                  StreamBuilder<bool>(
                    stream: _viewModel.outputPasswordAgainValidate,
                    builder: (context, snapshot) => TextFormField(
                      controller: _passAgaiTextEditCtrl,
                      decoration: InputDecoration(
                          labelText: _s.inputRepeatNewPassword,
                          hintText: _s.inputRepeatNewPassword,
                          errorText: (snapshot.data ?? true)
                              ? null
                              : _s.inputRepeatNewPasswordError),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: AppSize.s40),
                  StreamBuilder<bool>(
                      stream: _viewModel.outputInputsValidate,
                      builder: (_, snapshot) => SizedBox(
                            width: double.infinity,
                            height: AppSize.s40,
                            child: ElevatedButton(
                                onPressed: (snapshot.data ?? false)
                                    ? () => _viewModel
                                            .forgotPasswordConfirmation(
                                                context,
                                    _s.loading,
                                                widget.userId,
                                                widget.secret, () {
                                          _goLogin();
                                        })
                                    : null,
                                child: Text(_s.recover)),
                          )),
                  const SizedBox(height: AppSize.s20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _goLogin() => context.go(Routes.loginRoute);

  void _closeApp() => Platform.isAndroid ? SystemNavigator.pop() : exit(0);
}
