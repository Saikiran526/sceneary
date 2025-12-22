import 'package:flutter/material.dart';

class WelcomeBackViewmodel extends ChangeNotifier {
  final BuildContext context;

  WelcomeBackViewmodel({required this.context});

  final TextEditingController emailOrMobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();
}
