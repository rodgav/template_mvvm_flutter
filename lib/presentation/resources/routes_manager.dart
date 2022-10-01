import 'package:template_mvvm_flutter/app/app_preferences.dart';
import 'package:template_mvvm_flutter/app/dependency_injection.dart';
import 'package:template_mvvm_flutter/intl/generated/l10n.dart';
import 'package:template_mvvm_flutter/presentation/forgot_password/forgot_password.dart';
import 'package:template_mvvm_flutter/presentation/forgot_password_confirmation/forgot_password_confirmation.dart';
import 'package:template_mvvm_flutter/presentation/language/language.dart';
import 'package:template_mvvm_flutter/presentation/login/login.dart';
import 'package:template_mvvm_flutter/presentation/main/main.dart';
import 'package:template_mvvm_flutter/presentation/register/register.dart';
import 'package:template_mvvm_flutter/presentation/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splashRoute = '/';
  static const String languageRoute = '/language';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String forgotPasswordConfirmationRoute =
      '/forgotPasswordConfirmation';
  static const String mainRoute = '/main';
}

class RouteGenerator {
  static final AppPreferences _appPreferences = instance<AppPreferences>();

  static final router = GoRouter(
      routerNeglect: true,
      routes: [
        GoRoute(
            path: Routes.splashRoute,
            builder: (context, state) {
              return const SplashView();
            }),
        GoRoute(
            path: Routes.languageRoute,
            builder: (context, state) {
              final extra = state.extra as bool?;
              return LanguageView(back: extra ?? false);
            }),
        GoRoute(
            path: Routes.loginRoute,
            builder: (context, state) {
              initLoginModule();
              return const LoginView();
            }),
        GoRoute(
            path: Routes.registerRoute,
            builder: (context, state) {
              initRegisterModule();
              return const RegisterView();
            }),
        GoRoute(
            path: Routes.forgotPasswordRoute,
            builder: (context, state) {
              initForgotModule();
              return const ForgotPasswordView();
            }),
        GoRoute(
            path: Routes.forgotPasswordConfirmationRoute,
            builder: (context, state) {
              final userId = state.queryParams['userId'];
              final secret = state.queryParams['secret'];
              final expire = state.queryParams['expire'];
              initForgPassConfModule();
              return ForgotPasswordConfirmation(userId, secret, expire);
            }),
        GoRoute(
            path: Routes.mainRoute,
            builder: (context, state) {
              initMainModule();
              return const MainView();
            }),
      ],
      errorBuilder: (context, state) => unDefinedRoute(context),
      initialLocation: Routes.splashRoute,
      debugLogDiagnostics: true,
      redirect: (_, state) {
        final loggedIn = _appPreferences.getToken() != '';
        final loggingIn = state.subloc == Routes.splashRoute ||
            state.subloc == Routes.languageRoute ||
            state.subloc == Routes.loginRoute ||
            state.subloc == Routes.registerRoute ||
            state.subloc == Routes.forgotPasswordRoute ||
            state.subloc == Routes.forgotPasswordConfirmationRoute;
        if (!loggedIn) return loggingIn ? null : Routes.splashRoute;
        if (loggingIn) return Routes.mainRoute;
        return null;
      });

  static unDefinedRoute(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      body: Center(child: Text(s.noRouteFound)),
    );
  }
}
