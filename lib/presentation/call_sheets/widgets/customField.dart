import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final bool isRequired;
  final String? hintText;
  final TextEditingController? controller;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final String? errorText;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final String? svgPrefixIcon;
  final String? svgSuffixIcon;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color borderColor;
  final Color textColor;
  final Color hintColor;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;

  /// Gap after this field
  final double verticalGap;

  const CustomTextField({
    super.key,
    this.label,
    this.isRequired = false,
    this.hintText,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.svgPrefixIcon,
    this.svgSuffixIcon,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor = const Color(0x4D000000),
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.onChanged,
    this.inputFormatters,
    this.autofocus = false,
    this.verticalGap = 16.0, // default 16px
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label!,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 1.4,
                  letterSpacing: 0.01,
                  color: Color(0xFF252525),
                ),
              ),
              if (isRequired)
                const Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 2),
                  child: Text(
                    "*",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
        ],

        TextField(
          controller: controller,
          enabled: enabled,
          readOnly: readOnly,
          autofocus: autofocus,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          textAlign: textAlign,
          textCapitalization: textCapitalization,
          onChanged: onChanged,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: enabled ? textColor : Colors.grey.shade600,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 14,
              color: hintColor.withOpacity(0.7),
            ),
            counterText: "",
            errorText: errorText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            prefixIcon: svgPrefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(svgPrefixIcon!, width: 20),
                  )
                : prefixIcon != null
                ? Icon(prefixIcon, size: 20)
                : null,
            suffixIcon: svgSuffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(svgSuffixIcon!, width: 20),
                  )
                : suffixIcon != null
                ? Icon(suffixIcon, size: 20)
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black, width: 1.2),
            ),
          ),
        ),

        SizedBox(height: verticalGap),
      ],
    );
  }
}
