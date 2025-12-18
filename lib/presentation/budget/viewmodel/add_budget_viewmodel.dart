import 'package:flutter/material.dart';

class AddBudgetViewmodel extends ChangeNotifier {
  final BuildContext context;

  AddBudgetViewmodel({required this.context});

  TextEditingController controller=TextEditingController();

  List<String> phases = ['Pre-Production', 'Production', 'Post-Production'];

  String? selectedPhase;
  String? selectDepartment;
  String? selectSubDepartment;
  String? selectCurrency;
  String? selectUnitType;
  String? selectFreezeOrUnFreeze;

  void setSelectedPhase(String? phase) {
    selectedPhase = phase;
    notifyListeners();
  }
}
