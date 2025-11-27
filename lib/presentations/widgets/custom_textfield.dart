import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintTextStyle;
  final IconData? prefixIcon;
  final Widget? suffix;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool obscureText;
  final int maxLines;
  final int? maxlength;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffix,
    this.onTap,
    this.maxlength,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.hintTextStyle,
    this.keyboardType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFEDF1F3), width: 1),
      ),
      child: Row(
        children: [
          
          if (widget.prefixIcon != null)
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(widget.prefixIcon, size: 20, color: Colors.grey),
            ),
 
          Expanded(
            child: TextField(
              controller: widget.controller,
              readOnly: widget.readOnly,
              onTap: widget.onTap,
              maxLength: widget.maxlength,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText,
             maxLines: widget.maxLines,
              style: TextStyle(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                counterText: "",
                hintText: widget.hintText,
                hintStyle: widget.hintTextStyle ??
                    TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),

            if (widget.suffix != null)
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: widget.suffix!,
            ),
        ],
      ),
    );
  }
}
