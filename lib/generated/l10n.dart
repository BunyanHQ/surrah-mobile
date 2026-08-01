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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Surrah`
  String get appName {
    return Intl.message('Surrah', name: 'appName', desc: '', args: []);
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
    return Intl.message('Skip', name: 'skipButton', desc: '', args: []);
  }

  /// `Next`
  String get nextButton {
    return Intl.message('Next', name: 'nextButton', desc: '', args: []);
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
    return Intl.message('Password', name: 'password', desc: '', args: []);
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
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
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
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Login Success`
  String get loginSuccess {
    return Intl.message(
      'Login Success',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get registerTitle {
    return Intl.message(
      'Create an Account',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign up to get started and enjoy our services`
  String get registerSubtitle {
    return Intl.message(
      'Sign up to get started and enjoy our services',
      name: 'registerSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Example: John`
  String get firstNameHint {
    return Intl.message(
      'Example: John',
      name: 'firstNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Example: Doe`
  String get lastNameHint {
    return Intl.message(
      'Example: Doe',
      name: 'lastNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Example: +1 123 456 7890`
  String get phoneNumberHint {
    return Intl.message(
      'Example: +1 123 456 7890',
      name: 'phoneNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter your password`
  String get confirmPasswordHint {
    return Intl.message(
      'Re-enter your password',
      name: 'confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerButton {
    return Intl.message('Register', name: 'registerButton', desc: '', args: []);
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Register Success`
  String get registerSuccess {
    return Intl.message(
      'Register Success',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get sendResetLinkTitle {
    return Intl.message(
      'Send Reset Link',
      name: 'sendResetLinkTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address to receive a password reset link.`
  String get sendResetLinkSubtitle {
    return Intl.message(
      'Enter your email address to receive a password reset link.',
      name: 'sendResetLinkSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get sendResetLinkButton {
    return Intl.message(
      'Send Reset Link',
      name: 'sendResetLinkButton',
      desc: '',
      args: [],
    );
  }

  /// `Go back to Login`
  String get goBackToLogin {
    return Intl.message(
      'Go back to Login',
      name: 'goBackToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Password reset link sent successfully.`
  String get sendResetLinkSuccess {
    return Intl.message(
      'Password reset link sent successfully.',
      name: 'sendResetLinkSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get sendResetLinkCardTitle {
    return Intl.message(
      'Check your email',
      name: 'sendResetLinkCardTitle',
      desc: '',
      args: [],
    );
  }

  /// `We have sent a password reset link to your email address.`
  String get sendResetLinkCardBody {
    return Intl.message(
      'We have sent a password reset link to your email address.',
      name: 'sendResetLinkCardBody',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the email?`
  String get resendResetLinkTitle {
    return Intl.message(
      'Didn\'t receive the email?',
      name: 'resendResetLinkTitle',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resendResetLinkButton {
    return Intl.message(
      'Resend',
      name: 'resendResetLinkButton',
      desc: '',
      args: [],
    );
  }

  /// `Password reset link resent successfully.`
  String get resendResetLinkSuccess {
    return Intl.message(
      'Password reset link resent successfully.',
      name: 'resendResetLinkSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get updatePasswordTitle {
    return Intl.message(
      'Update Password',
      name: 'updatePasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password to update it.`
  String get updatePasswordSubtitle {
    return Intl.message(
      'Enter your new password to update it.',
      name: 'updatePasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get updatePasswordButton {
    return Intl.message(
      'Update Password',
      name: 'updatePasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Password updated successfully.`
  String get updatePasswordSuccess {
    return Intl.message(
      'Password updated successfully.',
      name: 'updatePasswordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Currency`
  String get setYourCurrencyTitle {
    return Intl.message(
      'Choose Your Currency',
      name: 'setYourCurrencyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select the currency used for prices, payments and balances.`
  String get setYourCurrencySubtitle {
    return Intl.message(
      'Select the currency used for prices, payments and balances.',
      name: 'setYourCurrencySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose Currency :`
  String get chooseCurrency {
    return Intl.message(
      'Choose Currency :',
      name: 'chooseCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `Set Your Salary`
  String get setYourSalaryTitle {
    return Intl.message(
      'Set Your Salary',
      name: 'setYourSalaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your salary amount and select the number of days in your salary cycle.`
  String get setYourSalarySubtitle {
    return Intl.message(
      'Enter your salary amount and select the number of days in your salary cycle.',
      name: 'setYourSalarySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Salary Amount`
  String get salaryAmount {
    return Intl.message(
      'Salary Amount',
      name: 'salaryAmount',
      desc: '',
      args: [],
    );
  }

  /// `Enter your salary amount`
  String get salaryAmountHint {
    return Intl.message(
      'Enter your salary amount',
      name: 'salaryAmountHint',
      desc: '',
      args: [],
    );
  }

  /// `Salary Day`
  String get salaryDay {
    return Intl.message('Salary Day', name: 'salaryDay', desc: '', args: []);
  }

  /// `Select the number of days in your salary cycle`
  String get salaryDayHint {
    return Intl.message(
      'Select the number of days in your salary cycle',
      name: 'salaryDayHint',
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
