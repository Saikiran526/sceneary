import 'package:flutter/material.dart';

Widget customDropdown({
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




Widget editContainer(){
  return Container(
    decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(3)
    ),
    child: Icon(Icons.edit, size: 18,color: Colors.white,),
  );
}