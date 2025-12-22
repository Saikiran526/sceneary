import 'package:flutter/material.dart';

class BasicInformationViewmodelOne  extends ChangeNotifier{
final BuildContext context;
BasicInformationViewmodelOne({
  required this.context
});
final TextEditingController fullNameController = TextEditingController();
final TextEditingController screenNameController = TextEditingController();
final TextEditingController emailIdController = TextEditingController();
final TextEditingController verifyEmailIdController = TextEditingController();
final TextEditingController mobileNOController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController reEnterPasswordController = TextEditingController();

String? selectCode="+91";
String? selectGender = "Male";

List<String> chooseCode = ['+91',"+23"];
List<String> chooseGender = ["Male","Female","Others "];

 void selectedCode(String value){
  selectCode = value;
  notifyListeners();
 }
 
 void selectedGender(String value){
  selectGender = value;
  notifyListeners();
 }
 

}       