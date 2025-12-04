import 'package:flutter/material.dart';

class CalenderViewmodel extends ChangeNotifier {
  final BuildContext context;

  CalenderViewmodel({required this.context}) {
    selectedDay = DateTime.now(); // ⭐ default selected is today
    focusedDay = DateTime.now();
  }

  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();
  bool wholeDayOff = false;
  bool wholeDayBusy = false;

  void updateSelectedDay(DateTime selected, DateTime focused) {
    selectedDay = selected;
    focusedDay = focused;
    notifyListeners();
  }
  void submitWholeDayOff (){
  wholeDayOff = !wholeDayOff;
  notifyListeners();
}
void submitWholeDayBusy (){
  wholeDayBusy = !wholeDayBusy;
  notifyListeners();
}
}
