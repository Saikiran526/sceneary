import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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

  /// SVG Icons
  final String? svgPrefixIcon;
  final String? svgSuffixIcon;
  final Color? svgPrefixIconColor;
  final Color? svgSuffixIconColor;

  /// Normal Icons
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;

  final Color borderColor;
  final Color textColor;
  final Color hintColor;

  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final VoidCallback? onTap;
  final double verticalGap;

  final Widget? centerIcon;
  final String? fileName;

  const CustomTextField({
    super.key,
    this.onTap,
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
    this.svgPrefixIconColor,
    this.svgSuffixIconColor,

    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,

    this.borderColor = const Color(0x4D000000),
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.onChanged,
    this.inputFormatters,
    this.autofocus = false,
    this.verticalGap = 16.0,
    this.centerIcon,
    this.fileName,
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
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: const Color(0xFF252525),
                ),
              ),
              if (isRequired)
                const Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Text(
                    "*",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
        ],

        Stack(
          alignment: Alignment.center,
          children: [
            TextField(
              onTap: onTap,
              controller: controller,
              enabled: enabled,
              readOnly: readOnly || onTap != null,
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
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: enabled ? textColor : Colors.grey.shade600,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: hintColor.withOpacity(0.7),
                ),
                counterText: "",
                errorText: errorText,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                ),

                /// PREFIX ICON
                prefixIcon: svgPrefixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          svgPrefixIcon!,
                          width: 20,
                          colorFilter: svgPrefixIconColor != null
                              ? ColorFilter.mode(
                                  svgPrefixIconColor!,
                                  BlendMode.srcIn,
                                )
                              : null,
                        ),
                      )
                    : prefixIcon != null
                    ? Icon(prefixIcon, size: 20, color: prefixIconColor)
                    : null,

                /// SUFFIX ICON
                suffixIcon: svgSuffixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          svgSuffixIcon!,
                          width: 20,
                          colorFilter: svgSuffixIconColor != null
                              ? ColorFilter.mode(
                                  svgSuffixIconColor!,
                                  BlendMode.srcIn,
                                )
                              : null,
                        ),
                      )
                    : suffixIcon != null
                    ? Icon(suffixIcon, size: 20, color: suffixIconColor)
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

            if (centerIcon != null)
              IgnorePointer(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    centerIcon!,
                    if (fileName != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        fileName!,
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
          ],
        ),

        SizedBox(height: verticalGap),
      ],
    );
  }
}
