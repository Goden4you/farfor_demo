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

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Stolovka`
  String get main_page_title {
    return Intl.message(
      'Stolovka',
      name: 'main_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Cart is empty`
  String get cart_is_empty {
    return Intl.message(
      'Cart is empty',
      name: 'cart_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Oops...`
  String get oops {
    return Intl.message(
      'Oops...',
      name: 'oops',
      desc: '',
      args: [],
    );
  }

  /// `Oops...`
  String get platform_error_occuried {
    return Intl.message(
      'Oops...',
      name: 'platform_error_occuried',
      desc: '',
      args: [],
    );
  }

  /// `Oops! Check your internet connection`
  String get connection_error_title {
    return Intl.message(
      'Oops! Check your internet connection',
      name: 'connection_error_title',
      desc: '',
      args: [],
    );
  }

  /// `Oops! Check your internet connection`
  String get connection_error_detail {
    return Intl.message(
      'Oops! Check your internet connection',
      name: 'connection_error_detail',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get unknown_error_title {
    return Intl.message(
      'Unknown error',
      name: 'unknown_error_title',
      desc: '',
      args: [],
    );
  }

  /// `Error occuried`
  String get unknown_error_detail {
    return Intl.message(
      'Error occuried',
      name: 'unknown_error_detail',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get big_data_error_title {
    return Intl.message(
      'Unknown error',
      name: 'big_data_error_title',
      desc: '',
      args: [],
    );
  }

  /// `Request entity too large`
  String get big_data_error_detail {
    return Intl.message(
      'Request entity too large',
      name: 'big_data_error_detail',
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
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
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
