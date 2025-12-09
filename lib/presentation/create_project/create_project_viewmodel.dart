import 'package:flutter/material.dart';

class CreateProjectViewmodel extends ChangeNotifier{
  final TextEditingController titleController=TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> pickStartDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    _startDate = picked;
    startDateController.text =
    "${picked?.day}/${picked?.month}/${picked?.year}";

    // Reset end date if invalid
    if (_endDate != null && _endDate!.isBefore(picked!)) {
      _endDate = null;
      endDateController.clear();
    }

    notifyListeners();
    }

  Future<void> pickEndDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? (_startDate ?? DateTime.now()),
      firstDate: _startDate ?? DateTime.now(), // Prevent earlier date
      lastDate: DateTime(2100),
    );

    _endDate = picked;
    endDateController.text =
    "${picked?.day}/${picked?.month}/${picked?.year}";

    notifyListeners();
    }

}