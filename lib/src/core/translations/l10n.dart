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

  /// `Flutter By Zain`
  String get appTitle {
    return Intl.message(
      'Flutter By Zain',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong\nPleaseTry again later.`
  String get someThingWentWrongDesc {
    return Intl.message(
      'Something went wrong\\nPleaseTry again later.',
      name: 'someThingWentWrongDesc',
      desc: '',
      args: [],
    );
  }

  /// `No Internet connection\nHurry up! get wifi`
  String get noInternetConnectionDesc {
    return Intl.message(
      'No Internet connection\\nHurry up! get wifi',
      name: 'noInternetConnectionDesc',
      desc: '',
      args: [],
    );
  }

  /// `Dashboad`
  String get dashboard {
    return Intl.message(
      'Dashboad',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Api Response Value`
  String get explore_search {
    return Intl.message(
      'Api Response Value',
      name: 'explore_search',
      desc: '',
      args: [],
    );
  }

  /// `User Profile`
  String get user_profile {
    return Intl.message(
      'User Profile',
      name: 'user_profile',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again`
  String get errorUndefinedErrorhappened {
    return Intl.message(
      'Something went wrong. Please try again',
      name: 'errorUndefinedErrorhappened',
      desc: '',
      args: [],
    );
  }

  /// `Request to the server was cancelled.`
  String get requestCancelled {
    return Intl.message(
      'Request to the server was cancelled.',
      name: 'requestCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Connection timed out.`
  String get connectionTimedOut {
    return Intl.message(
      'Connection timed out.',
      name: 'connectionTimedOut',
      desc: '',
      args: [],
    );
  }

  /// `Receiving timeout occurred.`
  String get receivingTimeout {
    return Intl.message(
      'Receiving timeout occurred.',
      name: 'receivingTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Request send timeout.`
  String get requestTimeout {
    return Intl.message(
      'Request send timeout.',
      name: 'requestTimeout',
      desc: '',
      args: [],
    );
  }

  /// `No Internet.`
  String get noInternet {
    return Intl.message(
      'No Internet.',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error occurred.`
  String get unexpectedError {
    return Intl.message(
      'Unexpected error occurred.',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong.`
  String get somethingWrong {
    return Intl.message(
      'Something went wrong.',
      name: 'somethingWrong',
      desc: '',
      args: [],
    );
  }

  /// `Bad request.`
  String get badRequest {
    return Intl.message(
      'Bad request.',
      name: 'badRequest',
      desc: '',
      args: [],
    );
  }

  /// `Authentication failed.`
  String get authenticationFailed {
    return Intl.message(
      'Authentication failed.',
      name: 'authenticationFailed',
      desc: '',
      args: [],
    );
  }

  /// `The authenticated user is not allowed to access the specified API endpoint.`
  String get authenticatedUserNotAllowed {
    return Intl.message(
      'The authenticated user is not allowed to access the specified API endpoint.',
      name: 'authenticatedUserNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `The requested resource does not exist.`
  String get resourceNotExist {
    return Intl.message(
      'The requested resource does not exist.',
      name: 'resourceNotExist',
      desc: '',
      args: [],
    );
  }

  /// `Method not allowed. Please check the Allow header for the allowed HTTP methods.`
  String get methodNotAllowed {
    return Intl.message(
      'Method not allowed. Please check the Allow header for the allowed HTTP methods.',
      name: 'methodNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Unsupported media type. The requested content type or version number is invalid.`
  String get unsupportedMediaType {
    return Intl.message(
      'Unsupported media type. The requested content type or version number is invalid.',
      name: 'unsupportedMediaType',
      desc: '',
      args: [],
    );
  }

  /// `Data validation failed.`
  String get dataValidationFailed {
    return Intl.message(
      'Data validation failed.',
      name: 'dataValidationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests.`
  String get tooManyRequests {
    return Intl.message(
      'Too many requests.',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error.`
  String get internalServerError {
    return Intl.message(
      'Internal server error.',
      name: 'internalServerError',
      desc: '',
      args: [],
    );
  }

  /// `Oops something went wrong!`
  String get oopsSomethingWrong {
    return Intl.message(
      'Oops something went wrong!',
      name: 'oopsSomethingWrong',
      desc: '',
      args: [],
    );
  }

  /// `Internal Error`
  String get internal_error {
    return Intl.message(
      'Internal Error',
      name: 'internal_error',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get processing {
    return Intl.message(
      'Processing',
      name: 'processing',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Copied`
  String get copied {
    return Intl.message(
      'Copied',
      name: 'copied',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
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
