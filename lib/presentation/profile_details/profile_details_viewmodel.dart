import 'package:flutter/cupertino.dart';

class ProfileDetailsViewmodel extends ChangeNotifier{

  // State
  int activeIndex=0;

  // Setter
  set updateIndex(int index) {
    activeIndex = index;
    notifyListeners();
  }

}