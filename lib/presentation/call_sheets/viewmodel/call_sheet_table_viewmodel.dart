import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';

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

  void showDownloadedSuccess(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(24),
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Template Downloaded successfully",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.0,
                    letterSpacing: 0,
                    color: const Color(0xFF3D3D3D),
                  ),
                ),

                const SizedBox(height: 16),

                AppButton(
                  label: "Okay",
                  fontWeight: FontWeight.w600,
                  fullWidth: true,
                  textColor: Color(0XFF1D55A8),
                  onTap: () {
                    AppRouter.instance.pop();
                  },
                  borderColor: Color(0XFF5D5D5D),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
