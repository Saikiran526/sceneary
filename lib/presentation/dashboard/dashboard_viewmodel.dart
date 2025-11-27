import 'package:flutter/cupertino.dart';

class DashboardViewModel extends ChangeNotifier{

  // State
  int _selectedIndex=0;
  TextEditingController searchQueryController=TextEditingController();

  // Getters
  int get selectedIndex=>_selectedIndex;

  // Setters
  set setSelectedIndex(int newIndex){
    _selectedIndex=newIndex;
    notifyListeners();
  }
  set setSearchQuery(String query){
    searchQueryController.text=query;
    notifyListeners();
  }

}