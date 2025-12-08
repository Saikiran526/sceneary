import 'package:flutter/material.dart';

class BudgetTabViewmodel extends ChangeNotifier {
  final BuildContext context;
  BudgetTabViewmodel({required this.context});

  List<String> tabs = ["Overview", "Details"];
  int selectedIndex = 0;

  void changeTab(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
