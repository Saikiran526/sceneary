import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';

class ScriptDiscussionViewmodel extends ChangeNotifier {
  final BuildContext context;

  ScriptDiscussionViewmodel({required this.context});
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController editTaskController = TextEditingController();
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

  Future<String?> showExtendDate() {
  return showDialog<String>(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Alert',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Divider(),
              const SizedBox(height: 8),
              const Text(
                'Date You Extending for your task ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text(
                'exceeding phase!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text(
                'First you have to extent your phase End date',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xff5D5D5D),
                          side: const BorderSide(
                            color: Color(0xff5D5D5D),
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context, "pick_date");
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xff5D5D5D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context, "continue");
                        },
                        child: const Text(
                          'Continue ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

}
