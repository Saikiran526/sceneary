import 'package:flutter/material.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';

class CreateCallSheetViewmodel extends ChangeNotifier {
  final BuildContext context;
  CreateCallSheetViewmodel({required this.context});

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

  void onNextPressed() {
    if (bannerNameController.text.isEmpty) {
      _showError("Banner Name is required");
      return;
    }

    if (producerController.text.isEmpty) {
      _showError("Producer Name is required");
      return;
    }
    if (directorController.text.isEmpty) {
      _showError("Director is required");
      return;
    }
    if (ceoController.text.isEmpty) {
      _showError("Ceo is Required");
      return;
    }

    if (dateController.text.isEmpty) {
      _showError("Shooting date is required");
      return;
    }
    if (shootingTimeController.text.isEmpty) {
      _showError("Shooting time is required");
      return;
    }

    if (breakFastController.text.isEmpty) {
      _showError("BreakFastTime is required");
      return;
    }

    if (lunchTimeController.text.isEmpty) {
      _showError("Lunch Time Controller");
      return;
    }

    if (dinnerController.text.isEmpty) {
      _showError("Dinner Time is Required");
      return;
    }
    if (wrapUpController.text.isEmpty) {
      _showError("Wrap Up is required");
      return;
    }

    if (teaCoffeContoller.text.isEmpty) {
      _showError("Tea/Coffe time is required");
      return;
    }
    if (selectedDay == null || selectedDay!.isEmpty) {
      _showError("Please select a day");
      return;
    }

    if (actorsController.text.isEmpty) {
      _showError("Actors are required");
      return;
    }

    if (selectCastController.text.isEmpty) {
      _showError("Select cast is required");
      return;
    }
    if (scriptPageController.text.isEmpty) {
      _showError("Script is required");
      return;
    }
    if (locationController.text.isEmpty) {
      _showError("Location is required");
      return;
    }
    AppRouter.instance.push(RoutePaths.createCallSheetCheckAvailabilityScreen);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  void dispose() {
    bannerNameController.dispose();
    producerController.dispose();
    directorController.dispose();
    ceoController.dispose();
    actorsController.dispose();
    selectCastController.dispose();
    sceneDescriptionController.dispose();
    scriptPageController.dispose();
    locationController.dispose();
    importantContactsController.dispose();
    dateController.dispose();
    shootingTimeController.dispose();
    breakFastController.dispose();
    lunchTimeController.dispose();
    dinnerController.dispose();
    wrapUpController.dispose();
    teaCoffeContoller.dispose();

    super.dispose();
  }
}
