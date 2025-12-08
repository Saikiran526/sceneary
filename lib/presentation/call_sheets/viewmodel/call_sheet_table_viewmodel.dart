import 'package:flutter/material.dart';

class CallSheetTableViewmodel extends ChangeNotifier {
  final BuildContext context;

  List<String> headers = [
    "Call Time",
    "Crew Name",
    "Department",
    "Role",
    "Location",
    "Contact",
    "Note",
    "Transport",
  ];

  late List<List<TextEditingController>> controllers;

  List<List<String>> callSheetData = [
    [
      "07:00 AM",
      "John Doe",
      "Camera",
      "DP",
      "Studio A",
      "9876543210",
      "On Time",
      "Van",
    ],
    [
      "07:30 AM",
      "Emma Smith",
      "Sound",
      "Boom Operator",
      "Studio B",
      "8765432109",
      "Bring Gear",
      "Self",
    ],
    [
      "08:00 AM",
      "Michael Lee",
      "Lights",
      "Gaffer",
      "Studio A",
      "7654321098",
      "Prep Early",
      "Van",
    ],
    [
      "08:15 AM",
      "Sophia Brown",
      "Makeup",
      "Artist",
      "Green Room",
      "6543210987",
      "Special Kit",
      "Self",
    ],
    [
      "09:00 AM",
      "David Clark",
      "Art",
      "Set Designer",
      "Studio B",
      "5432109876",
      "Props Updated",
      "Van",
    ],
  ];

  CallSheetTableViewmodel({required this.context}) {
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
}
