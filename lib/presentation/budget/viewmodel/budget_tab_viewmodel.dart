import 'package:flutter/material.dart';
import 'package:sceneary/presentation/budget/view/budget_version_screen.dart';

class BudgetTabViewmodel extends ChangeNotifier {
  final BuildContext context;
  BudgetTabViewmodel({required this.context});

  List<String> tabs = ["Overview", "Budget Sheet"];
  int selectedIndex = 0;

  void changeTab(int index) {
    selectedIndex = index;
    notifyListeners();

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) =>  BudgetVersionScreen()),
      );
    }
  }
}
