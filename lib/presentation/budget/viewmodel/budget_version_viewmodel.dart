import 'package:flutter/material.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';

class BudgetVersionViewmodel extends ChangeNotifier {
  final BuildContext context;

  List<String> headers = [
    "Department",
    "Sub Department",
    "Department",
    "Unit Type",
    "Rate per Unit",
    "NO of Units",
    "Estimated",
    "Actual",
    "Paid",
    "Due",
    "Varience",
    "Description",
    "Percentage",
    "GL Account",
    "GL A/C description",
  ];

  late List<List<TextEditingController>> controllers;
  List<List<String>> callSheetData = [
    [
      "Director",
      "Director",
      "Fixed",
      "5,000",
      "10",
      "9876543210",
      "On Time",
      "Van",
      "CS-001",
      "Scene 12",
      "Day 1",
      "Morning",
      "Director",
      "Daily",
      "Confirmed",
    ],
     [
      "Director",
      "Associate Director",
      "Daily",
      "5,000",
      "10",
      "9876543210",
      "On Time",
      "Van",
      "CS-001",
      "Scene 12",
      "Day 1",
      "Morning",
      "Director",
      "Daily",
      "Confirmed",
    ],
     [
      "Story",
      "Story Board",
      "Daily",
      "5,000",
      "10",
      "9876543210",
      "On Time",
      "Van",
      "CS-001",
      "Scene 12",
      "Day 1",
      "Morning",
      "Director",
      "Daily",
      "Confirmed",
    ],
       [
      "Story",
      "Story Board",
      "Daily",
      "5,000",
      "10",
      "9876543210",
      "On Time",
      "Van",
      "CS-001",
      "Scene 12",
      "Day 1",
      "Morning",
      "Director",
      "Daily",
      "Confirmed",
    ],   [
      "Story",
      "Writer",
      "Daily",
      "5,000",
      "10",
      "9876543210",
      "On Time",
      "Van",
      "CS-001",
      "Scene 12",
      "Day 1",
      "Morning",
      "Director",
      "Daily",
      "Confirmed",
    ],
  ];

  BudgetVersionViewmodel({required this.context}) {
    ensureMinimumRows(minRows: 10);

    initControllers();
  }

  void initControllers() {
    controllers = List.generate(
      callSheetData.length,
      (rowIndex) => List.generate(
        headers.length,
        (colIndex) =>
            TextEditingController(text: callSheetData[rowIndex][colIndex]),
      ),
    );
  }

  void updateCell(int rowIndex, int colIndex, String newValue) {
    callSheetData[rowIndex][colIndex] = newValue;
    notifyListeners();
  }

  bool rowHasData(int rowIndex) {
    return callSheetData[rowIndex].any((value) => value.trim().isNotEmpty);
  }

  String? selectedValue;
  List<String> items = ["Version 1", "Version 2", "Version 3"];

  void changeValue(String? value) {
    selectedValue = value;
    notifyListeners();
  }

  List<String> menuOptions = [
    'Add Budget',
    'Upload Sheets',
    'Edit Budget',
    'Download Sheet',
    'Freeze Budget',
  ];

  void onMenuSelected(String option) {
    switch (option) {
      case 'Upload Sheets':
        // uploadExcel();
        break;
      case 'Download Sheet':
        // downloadExcel();
        break;
      case 'Edit Budget':
        AppRouter.instance.push(RoutePaths.editBudgetScreen);
        // isFrozen = false;
        notifyListeners();
        break;
      case 'Freeze Budget':
        // toggleFreeze();
        break;
      case 'Add Budget':
        // future implementation
        AppRouter.instance.push(RoutePaths.actualsScreen);

        break;
    }
  }

  void clearAll() {
    notifyListeners();
  }

  void ensureMinimumRows({int minRows = 10}) {
    while (callSheetData.length < minRows) {
      callSheetData.add(List.generate(headers.length, (_) => ""));
    }
  }
}
