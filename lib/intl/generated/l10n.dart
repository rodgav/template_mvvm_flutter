// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Éxito`
  String get success {
    return Intl.message(
      'Éxito',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Solicitud incorrecta. inténtalo de nuevo más tarde`
  String get bad_request_error {
    return Intl.message(
      'Solicitud incorrecta. inténtalo de nuevo más tarde',
      name: 'bad_request_error',
      desc: '',
      args: [],
    );
  }

  /// `Solicitud prohibida. inténtalo de nuevo más tarde`
  String get forbidden_error {
    return Intl.message(
      'Solicitud prohibida. inténtalo de nuevo más tarde',
      name: 'forbidden_error',
      desc: '',
      args: [],
    );
  }

  /// `Usuario no autorizado, intente de nuevo más tarde`
  String get unauthorized_error {
    return Intl.message(
      'Usuario no autorizado, intente de nuevo más tarde',
      name: 'unauthorized_error',
      desc: '',
      args: [],
    );
  }

  /// `URL no encontrada, inténtalo de nuevo más tarde`
  String get not_found_error {
    return Intl.message(
      'URL no encontrada, inténtalo de nuevo más tarde',
      name: 'not_found_error',
      desc: '',
      args: [],
    );
  }

  /// `Conflicto encontrado, inténtalo de nuevo más tarde`
  String get conflict_error {
    return Intl.message(
      'Conflicto encontrado, inténtalo de nuevo más tarde',
      name: 'conflict_error',
      desc: '',
      args: [],
    );
  }

  /// `Algo salió mal, inténtalo de nuevo más tarde`
  String get internal_server_error {
    return Intl.message(
      'Algo salió mal, inténtalo de nuevo más tarde',
      name: 'internal_server_error',
      desc: '',
      args: [],
    );
  }

  /// `Algo salió mal, inténtalo de nuevo más tarde`
  String get unknown_error {
    return Intl.message(
      'Algo salió mal, inténtalo de nuevo más tarde',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `tiempo de espera, vuelve a intentarlo tarde`
  String get timeout_error {
    return Intl.message(
      'tiempo de espera, vuelve a intentarlo tarde',
      name: 'timeout_error',
      desc: '',
      args: [],
    );
  }

  /// `Algo salió mal, inténtalo de nuevo más tarde`
  String get default_error {
    return Intl.message(
      'Algo salió mal, inténtalo de nuevo más tarde',
      name: 'default_error',
      desc: '',
      args: [],
    );
  }

  /// `Error de caché, inténtalo de nuevo más tarde`
  String get cache_error {
    return Intl.message(
      'Error de caché, inténtalo de nuevo más tarde',
      name: 'cache_error',
      desc: '',
      args: [],
    );
  }

  /// `Por favor revise su conexion a internet`
  String get no_internet_error {
    return Intl.message(
      'Por favor revise su conexion a internet',
      name: 'no_internet_error',
      desc: '',
      args: [],
    );
  }

  /// `Éxito sin contenido`
  String get no_content {
    return Intl.message(
      'Éxito sin contenido',
      name: 'no_content',
      desc: '',
      args: [],
    );
  }

  /// `Cerrar`
  String get close {
    return Intl.message(
      'Cerrar',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar`
  String get confirm {
    return Intl.message(
      'Confirmar',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Volver a intentarlo`
  String get retryAgain {
    return Intl.message(
      'Volver a intentarlo',
      name: 'retryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Cargando...`
  String get loading {
    return Intl.message(
      'Cargando...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Enviar correo`
  String get sendEmail {
    return Intl.message(
      'Enviar correo',
      name: 'sendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Aceptar`
  String get accept {
    return Intl.message(
      'Aceptar',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Correo`
  String get inputEmail {
    return Intl.message(
      'Correo',
      name: 'inputEmail',
      desc: '',
      args: [],
    );
  }

  /// `Correo error`
  String get inputEmailError {
    return Intl.message(
      'Correo error',
      name: 'inputEmailError',
      desc: '',
      args: [],
    );
  }

  /// `Recuperar contraseña`
  String get recover {
    return Intl.message(
      'Recuperar contraseña',
      name: 'recover',
      desc: '',
      args: [],
    );
  }

  /// `Tengo una cuenta`
  String get haveAccount {
    return Intl.message(
      'Tengo una cuenta',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get inputPassword {
    return Intl.message(
      'Contraseña',
      name: 'inputPassword',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña error`
  String get inputPasswordError {
    return Intl.message(
      'Contraseña error',
      name: 'inputPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Nueva contraseña`
  String get inputNewPassword {
    return Intl.message(
      'Nueva contraseña',
      name: 'inputNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `La nueva contraseña debe tener una mayúscula, una minúscula, un número, un carácter especial y debe tener 8 caracteres`
  String get inputNewPasswordError {
    return Intl.message(
      'La nueva contraseña debe tener una mayúscula, una minúscula, un número, un carácter especial y debe tener 8 caracteres',
      name: 'inputNewPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Repetir nueva contraseña`
  String get inputRepeatNewPassword {
    return Intl.message(
      'Repetir nueva contraseña',
      name: 'inputRepeatNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Las contraseñas no coinciden`
  String get inputRepeatNewPasswordError {
    return Intl.message(
      'Las contraseñas no coinciden',
      name: 'inputRepeatNewPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Ingresar`
  String get login {
    return Intl.message(
      'Ingresar',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Has olvidado tu contraseña`
  String get forgotPassword {
    return Intl.message(
      'Has olvidado tu contraseña',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `No tiene permisos`
  String get notPermission {
    return Intl.message(
      'No tiene permisos',
      name: 'notPermission',
      desc: '',
      args: [],
    );
  }

  /// `Ruta no encontrada`
  String get noRouteFound {
    return Intl.message(
      'Ruta no encontrada',
      name: 'noRouteFound',
      desc: '',
      args: [],
    );
  }

  /// `Registrarse`
  String get register {
    return Intl.message(
      'Registrarse',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get inputName {
    return Intl.message(
      'Nombre',
      name: 'inputName',
      desc: '',
      args: [],
    );
  }

  /// `Nombre error`
  String get inputNameError {
    return Intl.message(
      'Nombre error',
      name: 'inputNameError',
      desc: '',
      args: [],
    );
  }

  /// `Anonimo`
  String get anonymous {
    return Intl.message(
      'Anonimo',
      name: 'anonymous',
      desc: '',
      args: [],
    );
  }

  /// `Elegir lenguaje`
  String get chooseLanguage {
    return Intl.message(
      'Elegir lenguaje',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Bienvenido`
  String get welcome {
    return Intl.message(
      'Bienvenido',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Empecemos`
  String get start {
    return Intl.message(
      'Empecemos',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Siguiente`
  String get next {
    return Intl.message(
      'Siguiente',
      name: 'next',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
