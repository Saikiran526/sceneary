import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownField extends StatelessWidget {
  final String? label;
  final bool isRequired;
  final String? hintText;
  final String? value; // optional
  final List<String> items;
  final Function(String?) onChanged;
  final String? errorText;
  final IconData? suffixIcon;
  final String? svgSuffixIcon;
  final double verticalGap;
  final bool enabled;

  const CustomDropdownField({
    super.key,
    this.label,
    this.isRequired = false,
    this.hintText,
    this.value,
    required this.items,
    required this.onChanged,
    this.errorText,
    this.suffixIcon,
    this.svgSuffixIcon,
    this.verticalGap = 16.0,
    this.enabled = true,
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
                style:  GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
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

        DropdownButtonFormField<String>(
          value: (value != null && items.contains(value)) ? value : null,
          onChanged: enabled ? onChanged : null,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(
              fontSize: 14,
              color: Colors.grey.withOpacity(0.7),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            errorText: errorText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0x4D000000)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0x4D000000)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black, width: 1.2),
            ),
            suffixIcon: svgSuffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(svgSuffixIcon!, width: 20),
                  )
                : suffixIcon != null
                ? Icon(suffixIcon, size: 20)
                : null,
          ),
          items: items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style:  GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
              .toList(),
        ),

        SizedBox(height: verticalGap),
      ],
    );
  }
}
