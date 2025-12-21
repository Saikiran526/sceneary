import 'package:flutter/material.dart';

void showTopAlert(
  BuildContext context, {
  required String message,
  String? message2,
  bool? isAlert, // true = error, false = success, null = neutral
  Duration duration = const Duration(seconds: 2),
}) {
  final overlay = Overlay.of(context);
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) {
      final bgColor = isAlert == true
          ? Colors.red.shade800
          : isAlert == false
          ? Colors.green
          : Colors.white;

      final textColor = isAlert == true ? Colors.white : Colors.black;

      final icon = isAlert == true
          ? Icons.error
          : isAlert == false
          ? Icons.check_circle
          : null;

      return Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 300),
            offset: const Offset(0, -0.05),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (icon != null) Icon(icon, color: textColor),
                  if (icon != null) const SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF090216), Color(0xFF9D306A)],
                            ).createShader(bounds);
                          },
                          child: Text(
                            message,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white, // required for shader
                            ),
                          ),
                        ),

                        if (message2 != null && message2!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            message2!,
                            style: TextStyle(color: textColor, fontSize: 13),
                          ),
                        ],
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      if (entry.mounted) entry.remove();
                    },
                    child: Icon(Icons.close, color: textColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );

  overlay.insert(entry);

  // Auto dismiss
  Future.delayed(duration, () {
    if (entry.mounted) entry.remove();
  });
}
