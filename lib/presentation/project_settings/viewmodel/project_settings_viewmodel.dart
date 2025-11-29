import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProjectSettingsViewmodel extends ChangeNotifier{
  final BuildContext context;
  ProjectSettingsViewmodel({
    required this.context
  });
  PageController pageController =PageController();
   
   int selectTab = 0;

   void changeTab(int index){
    selectTab =  index;
    pageController.animateToPage
    (index, 
    duration: Duration(microseconds: 200),
     curve: Curves.easeInOut);
     notifyListeners();
   }

   void updatePage(int index){
    selectTab =index;
   notifyListeners();
   }
}