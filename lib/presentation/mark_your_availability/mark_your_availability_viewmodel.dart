import 'package:flutter/material.dart';
 
class MarkYourAvailabilityViewmodel  extends ChangeNotifier{
  final BuildContext context;

  MarkYourAvailabilityViewmodel({
    required this.context
  });
bool wholeDayOff = false;
bool wholeDayBusy = false;
bool sixAm = false;
bool sevenAm = false;
bool eightAm = false;
bool nineAm = false;
bool tenAm = false;

void submitWholeDayOff (){
  wholeDayOff = !wholeDayOff;
  notifyListeners();
}
void submitWholeDayBusy (){
  wholeDayBusy = !wholeDayBusy;
  notifyListeners();
}
void submitSixAm (){
  sixAm = !sixAm;
  notifyListeners();
}
void submitSevenAm (){
  sevenAm = !sevenAm;
  notifyListeners();
}
void submitEightAm (){
  eightAm = !eightAm;
  notifyListeners();
}

void submitNineAm (){
  nineAm = !nineAm;
  notifyListeners();
}
void submitTenAm (){
  tenAm = !tenAm;
  notifyListeners();
}
} 