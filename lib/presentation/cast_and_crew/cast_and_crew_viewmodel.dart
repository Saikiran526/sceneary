import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CastAndCrewViewmodel extends ChangeNotifier {
  final BuildContext context;
  CastAndCrewViewmodel({required this.context});

  final TextEditingController showDateController = TextEditingController();

  int selectedTab = 0;
  String? selectCraft = "Select";
  String? viewPeople = "Select";

  List<String> chooseCraft = [
    "Select",
    "Actor",
    "Actress",
    "Director",
    "Assistant Director",
    "Cinematographer (DOP)",
  ];
  List<String> choosePeopleView = ["Select", "Anyone", "No one"];

  void selectedCraft(String value) {
    selectCraft = value;
    notifyListeners();
  }

  void selectedChosedPeople(String value) {
    viewPeople = value;
    notifyListeners();
  }

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  Future<void> selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if(picked != null){
      showDateController.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }
  
}
