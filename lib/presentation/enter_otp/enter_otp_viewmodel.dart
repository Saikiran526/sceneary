import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EnterOtpViewmodel extends ChangeNotifier{
  final BuildContext context;
  EnterOtpViewmodel({
    required this.context
  }){
    startTimer();
  }
  List<TextEditingController> otpControllers = List.generate(
    4,(index) => TextEditingController());

int seconds = 60;
Timer? timer;


void startTimer() {
  seconds = 60;
  timer?.cancel();
  timer = Timer.periodic(Duration(seconds: 1), (timer) {
    if (seconds > 0) {
      seconds--;
    } else {
      timer.cancel();
    }
    notifyListeners(); 
  });
}


void resendOtp(){
  startTimer();
  notifyListeners();
}
  

  void onTapChanged(String value, int index) {
   if (value.isNotEmpty && index < otpControllers.length - 1) {
    FocusScope.of(context).nextFocus();
  }

   if (value.isEmpty && index > 0) {
    FocusScope.of(context).previousFocus();
  }
}

    void submitOtp(){
      String otp = otpControllers.map((e) => e.text).join();
    }

    @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    timer?.cancel();
    super.dispose();
  }
}