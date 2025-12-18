import 'package:flutter/material.dart';

class AddExpenseViewmodel extends ChangeNotifier{

  final BuildContext context;
  AddExpenseViewmodel({required this.context});
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