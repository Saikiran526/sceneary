import 'package:flutter/material.dart';

Widget customTextField({
  required TextEditingController controller,
  required String hintText,
  TextStyle? hintTextStyle,
  IconData? prefixIcon,
  Widget? suffix,
  VoidCallback? onTap,
  bool readOnly = false,
  bool obscureText = false,
  int maxLines = 1,
  int? maxLength,
  TextInputType? keyboardType,
}) {
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
        if (prefixIcon != null)
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(prefixIcon, size: 20, color: Colors.grey),
          ),

        Expanded(
          child: TextField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            maxLength: maxLength,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLines: maxLines,
            style: TextStyle(fontSize: 14, color: Colors.black),
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              counterText: "",
              hintText: hintText,
              hintStyle: hintTextStyle ??
                  TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ),

        if (suffix != null)
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: suffix,
          ),
      ],
    ),
  );
}
Widget customTextFieldWithHeading({
  required Size size,
  required String heading,
  required String hintText,
  required TextEditingController controller,
  required bool readOnly,
  Widget? suffix,
  Icon? suffixIcon,
  int? maxLines
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        heading,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600
        ),
      ),
      SizedBox(height: size.height*0.01),
      TextField(
        controller: controller,
        readOnly: readOnly,
        maxLines: maxLines,
        decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1
              ),
            ),
            suffix: suffix,
            suffixIcon: suffixIcon

        ),
      )
    ],
  );
}
Widget customDropdownWithHeading({
  required String heading,
  required String hintText,
  required String? value,
  required List<String> items,
  required Function(String?) onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        heading,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 8),

      DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        items: items.map((e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ))
            .toList(),
        onChanged: onChanged,
      ),
    ],
  );
}
Widget customDropdown({
  required String? value,
  required String hintText,
  required List<String> items,
  required Function(String?) onChanged
}){
  return DropdownButtonFormField<String>(
    value: value,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
    ),
    items: items.map((e) => DropdownMenuItem(
      value: e,
      child: Text(e),
    ))
        .toList(),
    onChanged: onChanged,
  );
}


Widget primaryButton({
  required String text,
  required VoidCallback onPressed,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  return SizedBox(
    width: double.infinity,
    height: 40,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(vertical: 9.2, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          height: 1.0,
        ),
      ),
    ),
  );
}
Widget primaryOutlinedButton({
  required String text,
  required VoidCallback onPressed
}){
  return SizedBox(
    width: double.infinity,
    child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                    color: Colors.black,
                    width: 1
                )
            )
        ),
        child: Text(text,style: TextStyle(color: Colors.black),)
    ),
  );
}
AppBar customAppBar({required String title}){
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600
      ),
    ),
    backgroundColor: Color(0xffD9D9D9),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
    ),
  );
}