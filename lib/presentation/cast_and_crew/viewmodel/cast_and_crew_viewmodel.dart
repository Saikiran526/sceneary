import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';

class CastAndCrewViewmodel extends ChangeNotifier {
  final BuildContext context;
  CastAndCrewViewmodel({required this.context});

  final TextEditingController showDateController = TextEditingController();

  int selectedTab = 0;

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

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

  final List<bool> _selected = [false, false, false];

  bool isSelected(int index) => _selected[index];

  void toggle(int index, bool value) {
    _selected[index] = value;
    notifyListeners();
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
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Remove member from project?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 12),
                Text(
                  'Are you sure you want to remove Ravi Kumar from Kabaddi Warriors?',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  softWrap: true,
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppButton(
                        label: "Cancel",
                        onTap: () {
                          Navigator.pop(context);
                        },
                        buttonColor: Colors.white,
                        textColor: Color(0XFF1D55A8),
                        borderColor: Color(0XFF1D55A8),
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: AppButton(
                        label: "Yes Remove",
                        onTap: () {},
                        buttonColor: Color(0XFF1D55A8),
                        textColor: Colors.white,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AppButton(
                            label: "Cancel",
                            onTap: () {},
                            buttonColor: Colors.white,
                            textColor: Color(0XFF1D55A8),
                            borderColor: Color(0XFF1D55A8),
                          ),
                        ),

                        const SizedBox(width: 20),

                        Expanded(
                          child: AppButton(
                            label: "Save Changes",
                            onTap: () {},
                            buttonColor: Color(0XFF1D55A8),
                            textColor: Colors.white,
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
