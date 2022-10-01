import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:template_mvvm_flutter/app/app_preferences.dart';
import 'package:template_mvvm_flutter/app/constants.dart';
import 'package:template_mvvm_flutter/app/dependency_injection.dart';
import 'package:template_mvvm_flutter/presentation/resources/color_manager.dart';
import 'package:template_mvvm_flutter/presentation/resources/routes_manager.dart';
import 'package:template_mvvm_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _appPreferences = instance<AppPreferences>();
  final _appLinks = instance<AppLinks>();
  Timer? _timer;

  void _startDelay() {
    _timer =
        Timer(const Duration(milliseconds: DurationConstants.d800), _goNext);
  }

  void _goNext() async {
    final appLink = await _appLinks.getInitialAppLinkString();
    if (appLink != null) {
      if (appLink.contains(Constant.url)) {
        final route = appLink.replaceAll(Constant.url, '');
        _goRouter(route);
      } else {
        _checkLogin();
      }
    } else {
      _checkLogin();
    }
  }

  _goRouter(String route) {
    context.go(route);
  }

  _checkLogin() async {
    if (_appPreferences.getToken() != '') {
      _goMain();
    } else {
      _goLanguage();
    }
  }

  _goLanguage() {
    context.go(Routes.languageRoute, extra: false);
  }

  _goMain() {
    context.go(Routes.mainRoute);
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
          child: SizedBox(
              width: AppSize.s200, height: AppSize.s200, child: Placeholder())),
    );
  }
}
