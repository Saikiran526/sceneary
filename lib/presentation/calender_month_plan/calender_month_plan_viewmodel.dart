import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:sceneary/core/constants/assets_path.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';

class CalenderMonthPlanViewmodel extends ChangeNotifier {
  final BuildContext context;
  CalenderMonthPlanViewmodel({required this.context});
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  bool wholeDayOff = false;
  bool wholeDayBusy = false;


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
     final TextEditingController reasonController = TextEditingController();

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
                  left: 15,
                  right: 15,
                  top: 15,
                  bottom: MediaQuery.of(
                    context,
                  ).viewInsets.bottom
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
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              selectedTime != null
                                  ? selectedTime!.format(context)
                                  : "Select",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
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
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              toSelectedTime != null
                                  ? toSelectedTime!.format(context)
                                  : "Select",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              
                    const SizedBox(height: 28),
                    const Text(
                      'Select Availability',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
              
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedValue,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          items:chooseSelectedValue.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Add Comment',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child:  TextField(
                        controller:reasonController ,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter text...",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 24,),
                    primaryButton(text: 'Add', onPressed: (){}),
                     SizedBox(height: 100),
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
