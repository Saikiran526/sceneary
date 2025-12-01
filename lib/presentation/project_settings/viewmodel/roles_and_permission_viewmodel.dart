import 'package:flutter/material.dart';

class RolesAndPermissionViewmodel extends ChangeNotifier {
  final BuildContext context;

  RolesAndPermissionViewmodel({required this.context}) {
    initRows();
  }

  List<RowChecks> rows = [];

  void initRows() {
    rows = List.generate(6, (index) => RowChecks());
  }

  void toggleCheck1(int index, bool value) {
    rows[index].check1 = value;
    notifyListeners();
  }

  void toggleCheck2(int index, bool value) {
    rows[index].check2 = value;
    notifyListeners();
  }

  void toggleCheck3(int index, bool value) {
    rows[index].check3 = value;
    notifyListeners();
  }
}

class RowChecks {
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
}
