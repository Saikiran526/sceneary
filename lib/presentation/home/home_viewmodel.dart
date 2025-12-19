import 'package:flutter/cupertino.dart';

class HomeViewmodel extends ChangeNotifier {

  HomeViewmodel(){
    // getRemainingDatesOfCurrentMonth();
  }

  // State
  int _selectedDate=20;
  List<int> remainingDatesOfCurrentMonth = [20,21,22,23,24,25];
  int activeIndex = 0;

  // Getters
  int get selectedDate=>_selectedDate;

  // Setters
  set setSelectedDate(int newDate){
    _selectedDate=newDate;
    notifyListeners();
  }
  set updateIndex(int index) {
    activeIndex = index;
    notifyListeners();
  }

// Behaviour
// void getRemainingDatesOfCurrentMonth() {
//   DateTime today = DateTime.now();
//   int year = today.year;
//   int month = today.month;
//   int lastDay = DateTime(year, month + 1, 0).day;
//   remainingDatesOfCurrentMonth.clear();
//   for (int day = today.day; day <= lastDay; day++) {
//     remainingDatesOfCurrentMonth.add(day);
//   }
// }

}