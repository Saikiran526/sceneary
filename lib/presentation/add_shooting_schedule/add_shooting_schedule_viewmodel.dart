import 'package:flutter/cupertino.dart';

class AddShootingScheduleViewmodel extends ChangeNotifier{

  // State
  final PageController pageController = PageController();
  int currentPage = 0;

  // Behaviour
  set changePage(int page) {
    currentPage = page;
    notifyListeners();
  }

}