import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddMemberViewmodel extends ChangeNotifier{
  final BuildContext context;
  AddMemberViewmodel({
    required this.context
  });
  final TextEditingController nameController = TextEditingController();
final TextEditingController roleController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController characterController = TextEditingController();
String? assignLevel = "Editor";

List<String> selectAssignedLevel = ["Editor","Actor","Comedian","Hero" ];

void selectedAssignedLevel(String value){
   assignLevel = value;
   notifyListeners();
}

}