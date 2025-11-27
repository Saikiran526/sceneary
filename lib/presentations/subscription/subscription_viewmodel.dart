import 'package:flutter/material.dart';

class SubscriptionViewmodel  extends ChangeNotifier{

 String? selectDate;

Future<void> selectedDate(BuildContext context) async {
  final picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

}

}