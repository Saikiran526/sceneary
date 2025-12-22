import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditBudgetViewmodel extends ChangeNotifier {
  final BuildContext context;

  EditBudgetViewmodel({required this.context});

  List<String> phases = ['Pre-Production', 'Production', 'Post-Production'];

  String? selectedPhase;
  String? selectDepartment;
  String? selectSubDepartment;
  String? selectCurrency;
  String? selectUnitType;
  String? selectFreezeOrUnFreeze;

  void setSelectedPhase(String? phase) {
    selectedPhase = phase;
    notifyListeners();
  }

  void onDelete({required String action}) {
    switch (action) {
      case 'delete':
        showDeletePostDialog(context);
        break;
    }
  }

  void showDeletePostDialog(BuildContext context) {
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
                /// TEXT
                Text(
                  "Are you sure want delete the post",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 1.0, // line-height: 100%
                    letterSpacing: 0,
                    color: const Color(0xFF3D3D3D),
                  ),
                ),

                const SizedBox(height: 16),

                /// BUTTONS
                Row(
                  children: [
                    /// CANCEL
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0XFF5D5D5D)),
                          ),
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFF1D55A8),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    /// DELETE
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0XFF1D55A8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Delete",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
}
