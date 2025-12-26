import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sceneary/core/constants/app_colors.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/app_utils/fill_textform_filed.dart';
import 'package:sceneary/presentation/calender/model/calendar_intial_model.dart';

class CalenderIntialViewmodel extends ChangeNotifier {
  final BuildContext context;

  CalenderIntialViewmodel({required this.context}) {
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    isGreenDateSelected = _isGreenDot(_selectedDay!);
  }

  // -------------------- CONTROLLERS --------------------
  final TextEditingController reasonController = TextEditingController();

  // -------------------- DATE STATE --------------------
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  DateTime get focusedDay => _focusedDay;
  DateTime? get selectedDay => _selectedDay;

  // -------------------- UI STATE --------------------
  bool wholeDayOff = false;
  bool wholeDayBusy = false;
  bool editWholeDayBusy = false;
  bool editWholeDayOff = false;
  bool isGreenDateSelected = false;

  int selectedTab = 0;

  // -------------------- TIME / DROPDOWN --------------------
  TimeOfDay? selectedTime;
  TimeOfDay? toSelectedTime;
  String selectedValue = "Busy";

  final List<String> chooseSelectedValue = [
    "Busy",
    "Morning",
    "Afternoon",
    "Evening",
    "Night",
  ];

  // -------------------- DATA --------------------
  AvailabilityModel? _availabilityData;
  AvailabilityModel? get availabilityData => _availabilityData;

  // -------------------- CALENDAR HELPERS --------------------
  bool isGreenDot(DateTime day) {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    final checkDate = DateTime(day.year, day.month, day.day);
    final diff = todayDate.difference(checkDate).inDays;
    return diff == 2 || diff == 4;
  }

  bool _isGreenDot(DateTime day) => isGreenDot(day);

  // -------------------- ACTIONS --------------------
  void onDaySelected(DateTime selected, DateTime focused) {
    _selectedDay = selected;
    _focusedDay = focused;

    // toggle UI based on green date
    isGreenDateSelected = _isGreenDot(selected);

    // reset tab when date changes
    selectedTab = 0;

    notifyListeners();
  }

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  void goToPreviousMonth() {
    _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
    notifyListeners();
  }

  void goToNextMonth() {
    _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
    notifyListeners();
  }
  void submitEditWholeDayBusy(){
   editWholeDayBusy = !editWholeDayBusy;
   notifyListeners();
  }
void submitEditWholeDayoff(){
   editWholeDayOff = !editWholeDayOff;
   notifyListeners();
  }

  void submitWholeDayOff() {
    wholeDayOff = !wholeDayOff;
    notifyListeners();
  }

  void submitWholeDayBusy() {
    wholeDayBusy = !wholeDayBusy;
    notifyListeners();
  }

  void setAvailabilityData(AvailabilityModel data) {
    _availabilityData = data;
    notifyListeners();
  }

  // -------------------- BOTTOM SHEET --------------------
  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ),
                    const Text(
                      "Select Time",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _timePicker(
                          text: selectedTime?.format(context) ?? "Select",
                          onTap: () async {
                            final picked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (picked != null) {
                              setState(() => selectedTime = picked);
                            }
                          },
                        ),
                        SvgPicture.asset(AssetsPath.arrowForward),
                        _timePicker(
                          text: toSelectedTime?.format(context) ?? "Select",
                          onTap: () async {
                            final picked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (picked != null) {
                              setState(() => toSelectedTime = picked);
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Select Availability',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: selectedValue,
                      items: chooseSelectedValue
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => setState(() => selectedValue = v!),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Add Comment',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    FillTextFormField(
                      controller: reasonController,
                      hintText: 'Enter Text..',
                      maxLines: 4,
                    ),
                    const SizedBox(height: 24),
                    primaryButton(
                      text: 'Add',
                      onPressed: () {
                        if (selectedTime != null &&
                            toSelectedTime != null) {
                          setAvailabilityData(
                            AvailabilityModel(
                              fromTime: selectedTime!,
                              toTime: toSelectedTime!,
                              availability: selectedValue,
                              reason: reasonController.text,
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _timePicker({required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 91,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: secondaryColor600,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: text50,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
