import 'package:flutter/material.dart';

class PreProductionViewmodel extends ChangeNotifier {
  final BuildContext context;
  PreProductionViewmodel({
    required this.context
  });
  final TextEditingController searchController = TextEditingController();
  int selectedTab = 0;

}