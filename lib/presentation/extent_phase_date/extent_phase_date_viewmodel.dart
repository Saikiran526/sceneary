import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExtentPhaseDateViewmodel extends ChangeNotifier {
  final BuildContext context;

  ExtentPhaseDateViewmodel({
    required this.context
  });
   final TextEditingController startDateController = TextEditingController();
    final TextEditingController endDateController = TextEditingController();

    
  Future<void> selectStartDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      startDateController.text = DateFormat("dd-MM-yyyy").format(picked);
      notifyListeners();
    }
  }
   Future<void> selectendDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      endDateController.text = DateFormat("dd-MM-yyyy").format(picked);
      notifyListeners();
    }
  }
}