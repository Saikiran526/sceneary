import 'package:flutter/material.dart';

class EditCallSheetViewmodel extends ChangeNotifier {
  final BuildContext context;

  EditCallSheetViewmodel({required this.context});
    bool _selectAll = false;
  bool get selectAll => _selectAll;

  List<String> day = ['Sunday', 'Monday', 'Tuesday'];

  String? selectedDay;

  void setSelectedDay(String? day) {
    selectedDay = day;
    notifyListeners();
  }

  TextEditingController bannerNameController = TextEditingController();
  TextEditingController producerController = TextEditingController();
  TextEditingController directorController = TextEditingController();
  TextEditingController ceoController = TextEditingController();
  TextEditingController actorsController = TextEditingController();
  TextEditingController selectCastController = TextEditingController();
  TextEditingController sceneDescriptionController = TextEditingController();
  TextEditingController scriptPageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController importantContactsController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController shootingTimeController = TextEditingController();
  TextEditingController breakFastController = TextEditingController();
  TextEditingController lunchTimeController = TextEditingController();
  TextEditingController dinnerController = TextEditingController();
  TextEditingController wrapUpController = TextEditingController();
  TextEditingController teaCoffeContoller = TextEditingController();


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

      String formattedDate =
          "${pickedDate?.day.toString().padLeft(2, '0')}-"
          "${pickedDate?.month.toString().padLeft(2, '0')}-"
          "${pickedDate?.year}";
      controller.text = formattedDate;
      notifyListeners();
    } else {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        String formattedTime =
            "${pickedTime.hour.toString().padLeft(2, '0')}:"
            "${pickedTime.minute.toString().padLeft(2, '0')}";
        controller.text = formattedTime;
        notifyListeners();
      }
    }
  }

  void toggleSelectAll(bool value) {
    _selectAll = value;
    notifyListeners();
  }


}
