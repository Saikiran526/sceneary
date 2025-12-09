import 'package:flutter/material.dart';

class DocumentsViewmodel extends ChangeNotifier {

final BuildContext context;

DocumentsViewmodel({required this.context});

final List<Map<String, dynamic>> users = List.generate(
  15,
  (index) => {
    "name": "Rajesh Kumar",
    "docs": "Total Documents Uploaded - 12",
  },
);



}
