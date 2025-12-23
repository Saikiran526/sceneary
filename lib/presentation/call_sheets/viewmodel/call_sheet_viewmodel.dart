import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/presentation/call_sheets/widgets/app_button.dart';

class CallSheetViewmodel extends ChangeNotifier {
  final BuildContext context;
  CallSheetViewmodel({required this.context});

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
