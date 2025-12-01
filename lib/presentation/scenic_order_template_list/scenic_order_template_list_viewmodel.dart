import 'package:flutter/cupertino.dart';

class ScenicOrderTemplateListViewmodel extends ChangeNotifier{

  // State
  int _selectedTemplate=0;

  // Getters
  int get selectedTemplate=>_selectedTemplate;

  // Setters
  set setSelectedTemplate(int newSelectedTemplate){
    _selectedTemplate=newSelectedTemplate;
    notifyListeners();
  }

}