import 'package:flutter/cupertino.dart';

class DashboardViewModel extends ChangeNotifier{

  // State
  int _selectedIndex=0;


  // Getters
  int get selectedIndex=>_selectedIndex;

  // Setters
  set setSelectedIndex(int newIndex){
    _selectedIndex=newIndex;
    notifyListeners();
  }


}