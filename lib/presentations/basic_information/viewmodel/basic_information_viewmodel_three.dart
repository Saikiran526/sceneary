import 'package:flutter/material.dart';

class BasicInformationViewmodelThree extends ChangeNotifier {
  final BuildContext context;
  BasicInformationViewmodelThree ({
    required this.context
  });
  final TextEditingController portfolioLinkController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
      final TextEditingController bioController = TextEditingController();
 bool checkBox = false;
 void submitCheckBox(){
  checkBox = !checkBox;
  notifyListeners();
 }
}