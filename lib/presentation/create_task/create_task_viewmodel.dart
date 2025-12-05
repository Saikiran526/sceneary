import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTaskViewmodel extends ChangeNotifier {
  final BuildContext context;

  CreateTaskViewmodel({required this.context});
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController addTaskController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController addMembernController = TextEditingController();

  String? selectPhase = 'Select';
  String? seectStatus = "Select";

  List<String> choosePhase = [
    "Select",
    'First phase',
    "Secons phase",
    "Third phase",
  ];
  List<String> chooseStatus = ["Select", 'On Going', "Hold", "Off"];

  void selectedPhase(String value) {
    selectPhase = value;
    notifyListeners();
  }

  void selectedStatus(String value) {
    seectStatus = value;
    notifyListeners();
  }

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
