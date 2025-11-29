import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CastAndCrewViewmodel extends ChangeNotifier {
  final BuildContext context;
  CastAndCrewViewmodel({required this.context});

  final TextEditingController showDateController = TextEditingController();

  int selectedTab = 0;
  String? selectCraft = "Select";
  String? viewPeople = "Select";

  List<String> chooseCraft = [
    "Select",
    "Actor",
    "Actress",
    "Director",
    "Assistant Director",
    "Cinematographer (DOP)",
  ];
  List<String> choosePeopleView = ["Select", "Anyone", "No one"];

  void selectedCraft(String value) {
    selectCraft = value;
    notifyListeners();
  }

  void selectedChosedPeople(String value) {
    viewPeople = value;
    notifyListeners();
  }

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  Future<void> selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      showDateController.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  void showRemoveDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Remove member from project?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 12),
                Text(
                  'Are you sure you want to remove Ravi Kumar from Kabaddi Warriors?',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF454545),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Yes remove',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void changeAccessDailog() {
    int selectedValue = 1;
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Change Access Level',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Update permissions for JD',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF5D5D5D),
                      ),
                    ),
                    SizedBox(height: 12),

                    buildRadioOption(
                      title: "Viewer",
                      subtitle:
                          "Can view project details but cannot make any changes.",
                      value: 1,
                      groupValue: selectedValue,
                      onChanged: (val) => setState(() => selectedValue = val!),
                    ),

                    buildRadioOption(
                      title: "Editor",
                      subtitle:
                          "Can edit project details manage schedules and budgets.",
                      value: 2,
                      groupValue: selectedValue,
                      onChanged: (val) => setState(() => selectedValue = val!),
                    ),

                    buildRadioOption(
                      title: "Manager",
                      subtitle:
                          "Full access to manage all aspects including team permissions",
                      value: 3,
                      groupValue: selectedValue,
                      onChanged: (val) => setState(() => selectedValue = val!),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF454545),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Save Changes',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildRadioOption({
    required String title,
    required String subtitle,
    required int value,
    required int groupValue,
    required ValueChanged<int?> onChanged,
  }) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio<int>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 11, color: Color(0xFF6C6C6C)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
