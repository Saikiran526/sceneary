import 'package:flutter/material.dart';

class EditCallSheetViewmodel extends ChangeNotifier {
  final BuildContext context;

  EditCallSheetViewmodel({required this.context});
    bool _selectAll = false;
  bool get selectAll => _selectAll;

  void toggleSelectAll(bool value) {
    _selectAll = value;
    notifyListeners();
  }
}
