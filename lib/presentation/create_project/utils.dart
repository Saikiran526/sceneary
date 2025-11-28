import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

Widget customTextField({
  String? label,
  required String hint,
  required TextEditingController controller,
  int maxLines = 1,
  bool enabled = true,
  IconData? suffixIcon,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
          child: label != null
              ? Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
              : null,
        ),
        SizedBox(height: 4),
        TextField(
          controller: controller,
          maxLines: maxLines,
          enabled: enabled,
          readOnly: onTap != null,
          onTap: onTap,

          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0XFF5D5D5D),
            ),
            suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,

            contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0x33000000),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0x33000000),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0x33000000),
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: const Color(0x33000000).withOpacity(0.5),
                width: 1,
              ),
            ),
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