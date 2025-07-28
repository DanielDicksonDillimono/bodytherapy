import 'package:flutter/material.dart';

class AppLocalization {
  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  static const _strings = <String, String>{
    'app_name': 'Body Therapy',
    'welcome_message': 'Welcome to Body Therapy',
    'login': 'Login',
    'name': 'Name',
    'sign_up': 'Sign Up',
    'home': 'Home',
    'exercises': 'Exercises',
    'reports': 'Reports',
    'preferences': 'Preferences',
    'login_message': 'Please login to continue',
    'sign_up_message': 'Create Account',
    'email': 'Email',
    'password': 'Password',
    'confirm_password': 'Confirm Password',
    'forgot_password': 'Forgot Password?',
    'submit': 'Submit',
    'cancel': 'Cancel',
    'settings': 'Settings',
    'language': 'Language',
    'dark_mode': 'Dark Mode',
    'light_mode': 'Light Mode',
    'enter_email': 'Enter your email',
    'enter_password': 'Enter your password',
    'sign_up_error': 'Sign Up Error',
    'login_button_text': 'Login',
    'email_validation': 'Please enter a valid email',
    'enter_confirm_password': 'Confirm your password',
    'enter_valid_name': 'Please enter a valid name',
    'sign_up_failed': 'Sign Up Failed',
    'create_report': 'Create Report',
    'accept_terms': 'Please accept the terms and conditions',
    'terms_conditions': 'Open Terms and Conditions',
    'i_accept': 'I Accept',
  };

//in case the key is not found, it will return the key itself
  static String _get(String key) {
    return _strings[key] ?? key;
  }

  String get appName => _get('app_name');
  String get welcomeMessage => _get('welcome_message');
  String get login => _get('login');
  String get name => _get('name');
  String get signUp => _get('sign_up');
  String get home => _get('home');
  String get exercises => _get('exercises');
  String get reports => _get('reports');
  String get preferences => _get('preferences');
  String get loginMessage => _get('login_message');
  String get signUpMessage => _get('sign_up_message');
  String get email => _get('email');
  String get password => _get('password');
  String get confirmPassword => _get('confirm_password');
  String get forgotPassword => _get('forgot_password');
  String get submit => _get('submit');
  String get cancel => _get('cancel');
  String get settings => _get('settings');
  String get language => _get('language');
  String get darkMode => _get('dark_mode');
  String get lightMode => _get('light_mode');
  String get enterEmail => _get('enter_email');
  String get enterPassword => _get('enter_password');
  String get enterConfirmPassword => _get('confirm_password');
  String get enterEmailOrPassword => _get('enter_email_or_password');
  String get enterValidEmail => _get('email_validation');
  String get enterValidPassword => _get('enter_valid_password');
  String get signUpError => _get('sign_up_error');
  String get loginButtonText => _get('login_button_text');
  String get signUpButtonText => _get('sign_up_button_text');
  String get enterValidName => _get('enter_valid_name');
  String get signUpFailed => _get('key_sign_up_failed');
  String get createReport => _get('Create Report');
  String get acceptTerms => _get('accept_terms');
  String get termsConditions => _get('terms_conditions');
  String get iAccept => _get('i_accept');

  String defaultError(String message) =>
      '$message An error occurred. Please try again.';

  String get emailRegex => r'^[^@]+@[^@]+\.[^@]+';
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es', 'nl', 'de'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    return AppLocalization();
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
