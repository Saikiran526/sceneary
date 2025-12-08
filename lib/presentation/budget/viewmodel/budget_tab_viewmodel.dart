import 'package:flutter/material.dart';

class BudgetTabViewmodel extends ChangeNotifier {
  final BuildContext context;

  BudgetTabViewmodel({required this.context});
   int selectedIndex = 0;
  final List<String> tabs = ["Overview", "Budget Sheet"];

  void changeTab(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  
}