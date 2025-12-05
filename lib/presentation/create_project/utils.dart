import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

Widget customTextField({
  String? label,
  required String hint,
  required TextEditingController controller,
  int maxLines = 1,
  bool enabled = true,
  Widget? suffix,
  Widget? prefix,   // 🔥 ADDED PREFIX
  VoidCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

        Container(
          width: 328,
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0x33000000), width: 1),
          ),

          child: Row(
            children: [

              // 🔥 PREFIX ICON
              if (prefix != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(height: 16, width: 16, child: prefix),
                ),

              // TEXTFIELD
              Expanded(
                child: TextField(
                  controller: controller,
                  maxLines: maxLines,
                  enabled: enabled,
                  readOnly: onTap != null,
                  onTap: onTap,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    isCollapsed: true,
                  ),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              // SUFFIX ICON
              if (suffix != null) const SizedBox(width: 10),
              if (suffix != null)
                SizedBox(height: 16, width: 16, child: suffix),
            ],
          ),
        ),
      ],
    ),
  );
}


Widget uploadWidget({
  String? label,
  double width = double.infinity,
  double height = 140,
  VoidCallback? onTap,
  IconData icon = Icons.cloud_upload_outlined,
  String title = "Upload File",
  String subtitle = "Supported formats: PDF, JPG, PNG",
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (label != null) ...[
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
      ],
      GestureDetector(
        onTap: onTap,
        child: DottedBorder(
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: Colors.grey),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget responsiveButton({
  String? text,
  VoidCallback? onTap,
  double? widthFactor,
  double? height,
  Color? bgColor,
  Color? textColor,
  double borderRadius = 8,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.w600,
  IconData? suffixIcon,
  Color? borderColor,
  double borderWidth = 1,
  EdgeInsetsGeometry? padding,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final screenWidth = MediaQuery.of(context).size.width;
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: widthFactor != null ? screenWidth * widthFactor : null,
          height: height ?? 48,
          padding:
              padding ??
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: bgColor ?? Colors.black,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (text != null)
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      text,
                      style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              if (suffixIcon != null) ...[
                const SizedBox(width: 8),
                Icon(
                  suffixIcon,
                  color: textColor ?? Colors.white,
                  size: fontSize + 2,
                ),
              ],
            ],
          ),
        ),
      );
    },
  );
}
