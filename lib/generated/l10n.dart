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

  /// `Surrah`
  String get appName {
    return Intl.message(
      'Surrah',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Track Every Dollar`
  String get onBoardingTitle1 {
    return Intl.message(
      'Track Every Dollar',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Build Better Habits`
  String get onBoardingTitle2 {
    return Intl.message(
      'Build Better Habits',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Achieve Your Goals`
  String get onBoardingTitle3 {
    return Intl.message(
      'Achieve Your Goals',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Stay In Control`
  String get onBoardingTitle4 {
    return Intl.message(
      'Stay In Control',
      name: 'onBoardingTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Easily track your income and expenses.`
  String get onBoardingBody1 {
    return Intl.message(
      'Easily track your income and expenses.',
      name: 'onBoardingBody1',
      desc: '',
      args: [],
    );
  }

  /// `Build better financial habits for a better life.`
  String get onBoardingBody2 {
    return Intl.message(
      'Build better financial habits for a better life.',
      name: 'onBoardingBody2',
      desc: '',
      args: [],
    );
  }

  /// `Save money and achieve your financial goals.`
  String get onBoardingBody3 {
    return Intl.message(
      'Save money and achieve your financial goals.',
      name: 'onBoardingBody3',
      desc: '',
      args: [],
    );
  }

  /// `Take control of your finances and future.`
  String get onBoardingBody4 {
    return Intl.message(
      'Take control of your finances and future.',
      name: 'onBoardingBody4',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipButton {
    return Intl.message(
      'Skip',
      name: 'skipButton',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get nextButton {
    return Intl.message(
      'Next',
      name: 'nextButton',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStartedButton {
    return Intl.message(
      'Get Started',
      name: 'getStartedButton',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back👋`
  String get loginTitle {
    return Intl.message(
      'Welcome Back👋',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to Continue to your account and enjoy our services`
  String get loginSubtitle {
    return Intl.message(
      'Sign in to Continue to your account and enjoy our services',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `john.doe@example.com`
  String get emailAddressHint {
    return Intl.message(
      'john.doe@example.com',
      name: 'emailAddressHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `8+ characters with upper, lower, number & symbol`
  String get passwordHint {
    return Intl.message(
      '8+ characters with upper, lower, number & symbol',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get orContinueWith {
    return Intl.message(
      'Or continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
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
