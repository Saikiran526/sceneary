import 'package:flutter/material.dart';
 
class NotificationViewmodel extends ChangeNotifier{
final BuildContext context;

NotificationViewmodel({required this.context});
 bool showDetails = false;

  void toggleDetails() {
    showDetails = !showDetails;
    notifyListeners();
  }
}