import 'package:flutter/material.dart';

class BasicInformationPageviewViewmodel extends ChangeNotifier {
  final BuildContext context;
  BasicInformationPageviewViewmodel({
    required this.context
  });
  final PageController pageController = PageController();
   int currentPage = 0;
  void changePage(int page) {
    currentPage = page;
    notifyListeners();
  }
}