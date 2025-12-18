import 'package:flutter/material.dart';

class VerifyYourIdentityViewmodel extends ChangeNotifier{
  final BuildContext context;
  VerifyYourIdentityViewmodel ({
    required this.context
  });
  bool isVideoStarted = false;
  List<String> guidelinesData = [
"Your full face must be visible",
"Use good lighting",
"No mask / sunglasses / filters",
"Say the number loud and clear",
"Make sure only you appear in the frame",
  ];
   void startVideo() {
    isVideoStarted = true;
    notifyListeners();
  }

  void retakeVideo() {
    isVideoStarted = false;
    notifyListeners();
  }
} 