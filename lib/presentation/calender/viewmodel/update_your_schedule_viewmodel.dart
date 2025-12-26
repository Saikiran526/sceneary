import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:sceneary/core/constants/app_colors.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';
import 'package:sceneary/presentation/app_utils/fill_textform_filed.dart';
import 'package:sceneary/presentation/calender/model/calendar_intial_model.dart';

class CalenderMonthPlanViewmodel extends ChangeNotifier {
  final BuildContext context;
  CalenderMonthPlanViewmodel({required this.context});
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  bool wholeDayOff = false;
  bool wholeDayBusy = false;
  AvailabilityModel? _availabilityData;
  AvailabilityModel? get availabilityData => _availabilityData;
int selectedTab = 0;

void changeTab(int index) {
  selectedTab = index;
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

  Future<void> selectFromDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      fromDateController.text = DateFormat("dd-MM-yyyy").format(picked);
      notifyListeners();
    }
  }

  Future<void> selectToDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      toDateController.text = DateFormat("dd-MM-yyyy").format(picked);
      notifyListeners();
    }
  }

  TimeOfDay? selectedTime;
  TimeOfDay? toSelectedTime;
  String? selectedValue = "Busy";
  List<String> chooseSelectedValue = [
    "Busy",
    "Morning",
    "Afternoon",
    "Evening",
    "Night",
  ];

  void setAvailabilityData(AvailabilityModel data) {
    _availabilityData = data;
    notifyListeners();
  }

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
                  mainAxisSize: MainAxisSize.min,
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
                        GestureDetector(
                          onTap: () async {
                            final picked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (picked != null) {
                              setState(() {
                                selectedTime = picked;
                              });
                            }
                          },
                          child: Container(
                            width: 91,
                            height: 32,
                            decoration: BoxDecoration(
                              color: secondaryColor600,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              selectedTime != null
                                  ? selectedTime!.format(context)
                                  : "Select",
                              style: const TextStyle(
                                fontSize: 12,
                                color: text50,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SvgPicture.asset(AssetsPath.arrowForward),
                        GestureDetector(
                          onTap: () async {
                            final picked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (picked != null) {
                              setState(() {
                                toSelectedTime = picked;
                              });
                            }
                          },
                          child: Container(
                            width: 91,
                            height: 32,
                            decoration: BoxDecoration(
                              color: secondaryColor600,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              toSelectedTime != null
                                  ? toSelectedTime!.format(context)
                                  : "Select",
                              style: const TextStyle(
                                fontSize: 12,
                                color: text50,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),
                    const Text(
                      'Select Availability',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 12),
                    InputDecorator(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0x4D000000),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0x4D000000),
                            width: 1,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedValue,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 24,
                            color: Colors.black,
                          ),
                          items: chooseSelectedValue.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() => selectedValue = value!);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Add Comment',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    FillTextFormField(
                      controller: reasonController,
                      hintText: 'Enter Text..',
                      maxLines: 4,
                    ),
                    SizedBox(height: 24),
                    primaryButton(
                      text: 'Add',
                      onPressed: () {
                        if (selectedTime != null &&
                            toSelectedTime != null &&
                            selectedValue != null) {
                          setAvailabilityData(
                            AvailabilityModel(
                              fromTime: selectedTime!,
                              toTime: toSelectedTime!,
                              availability: selectedValue!,
                              reason: reasonController.text,
                            ),
                          );

                          Navigator.pop(context);
                        }
                      },
                    ),

                    SizedBox(height: 80),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
