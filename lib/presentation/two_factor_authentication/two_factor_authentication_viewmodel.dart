import 'package:flutter/cupertino.dart';

class TwoFactorAuthenticationViewmodel extends ChangeNotifier{

  // State
  String? _selectedOption;

  // Getters
  String? get selectedOption=>_selectedOption;

  // Setters
  set setSelectedOption(String newOption){
    _selectedOption=newOption;
    notifyListeners();
  }

}