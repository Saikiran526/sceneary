import 'package:flutter/material.dart';

class WelcomeBackViewmodel extends ChangeNotifier {
  final BuildContext context;

  WelcomeBackViewmodel({required this.context}) {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus && passwordController.text.isEmpty) {
        isPasswordError = true;
        passwordErrorText = 'Password is required';
        notifyListeners();
      }
    });
  }

  final TextEditingController emailOrMobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();

  bool isEmailError = false;
  String emailErrorText = '';

  bool isPasswordError = false;
  String passwordErrorText = '';

  void validateEmail() {
    final email = emailOrMobileController.text.trim();
    if (email.isEmpty) {
      isEmailError = true;
      emailErrorText = 'Email is required';
    } else if (!_isValidEmail(email)) {
      isEmailError = true;
      emailErrorText = 'Enter a valid email address';
    } else {
      isEmailError = false;
      emailErrorText = 's';
    }
    notifyListeners();
  }

  void validatePassword({bool isFromFocus = false}) {
    final password = passwordController.text.trim();

    if (password.isEmpty) {
      isPasswordError = true;
      passwordErrorText = 'Please enter your password';
    } else {
      isPasswordError = false;
      passwordErrorText = '';
    }

    notifyListeners();
  }

   bool validateLogin() {
    validateEmail();
    validatePassword();

    return !isEmailError && !isPasswordError;
  }

   bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  @override
  void dispose() {
    emailOrMobileController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
