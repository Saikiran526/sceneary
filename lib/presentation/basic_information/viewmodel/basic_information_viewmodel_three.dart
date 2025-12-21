import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BasicInformationViewmodelThree extends ChangeNotifier {
  final BuildContext context;
  BasicInformationViewmodelThree({required this.context});
  final TextEditingController portfolioLinkController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  bool checkBox = false;
  String? selectCraft = "Select";

  List<String> chooseCraft = [
    "Select",
    "Hyderabad",
    "Banglore",
    "Mumbai",
  ];
  void selectedCraft(String value) {
    selectCraft = value;
    notifyListeners();
  }

  void submitCheckBox() {
    checkBox = !checkBox;
    notifyListeners();
  }

  
 List<File> images = [];

Future<void> pickImage() async {
  if (images.length >= 5) return;

  final picker = ImagePicker();
  final XFile? picked =
      await picker.pickImage(source: ImageSource.gallery);

  if (picked != null) {
    images.add(File(picked.path));
    notifyListeners();
  }
}

void removeImage(int index) {
  images.removeAt(index);
  notifyListeners();
}


}
