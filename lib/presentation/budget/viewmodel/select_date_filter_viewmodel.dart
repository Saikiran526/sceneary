import 'package:flutter/material.dart';

class SelectDateFilterViewmodel extends ChangeNotifier {
  final BuildContext context;
  SelectDateFilterViewmodel({required this.context});

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  Future<void> pickDateOrTime({
    required TextEditingController controller,
    required bool isDate,
  }) async {
    if (isDate) {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (pickedDate == null) return;

      String formattedDate =
          "${pickedDate.day.toString().padLeft(2, '0')}-"
          "${pickedDate.month.toString().padLeft(2, '0')}-"
          "${pickedDate.year}";

      controller.text = formattedDate;
      notifyListeners();
    } else {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime == null) return;

      String formattedTime =
          "${pickedTime.hour.toString().padLeft(2, '0')}:" +
          "${pickedTime.minute.toString().padLeft(2, '0')}";

      controller.text = formattedTime;
      notifyListeners();
    }
  }

  void onSavePressed() {}

  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }
}
