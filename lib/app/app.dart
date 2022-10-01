import 'package:template_mvvm_flutter/intl/generated/l10n.dart';
import 'package:template_mvvm_flutter/presentation/resources/routes_manager.dart';
import 'package:template_mvvm_flutter/presentation/resources/strings_manager.dart';
import 'package:template_mvvm_flutter/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_preferences.dart';
import 'dependency_injection.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        routeInformationProvider:
            RouteGenerator.router.routeInformationProvider,
        routeInformationParser: RouteGenerator.router.routeInformationParser,
        routerDelegate: RouteGenerator.router.routerDelegate,
        theme: getApplicationTheme(),
        locale: _appPreferences.getLocale(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales);
  }
}
