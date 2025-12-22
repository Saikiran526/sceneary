import 'package:flutter/material.dart';

class BasicInformationViewmodelTwo extends ChangeNotifier {
  final BuildContext context;
  BasicInformationViewmodelTwo({required this.context});
 
final TextEditingController instaUserNameController = TextEditingController();
final TextEditingController youtubeController = TextEditingController();

 


  String? selectCraft = "Select";
  String? selectSubCraft = "Select";
  String? selectExperienceLevel = "Select your experience level";


  List<String> chooseCraft = [
    "Select",
    "Actor",
    "Actress",
    "Director",
    "Assistant Director",
    "Cinematographer (DOP)",
    
  ];
   List<String> chooseSubCraft = [
    "Select",
    "Editor",
    "Script Writer",
    "Art Director",
    "Makeup Artist",
    "Costume Designer",
    "Sound Engineer",
    "Singer",
    "Producer",
  ];
  List<String> chooseExperienceLevel = [
    "Select your experience level",
    "0 - 3 Beginner",
    "3 - 6 Intermediate",
    "6+ Experienced"
  ];


  void selectedCraft(String value) {
    selectCraft = value;
    notifyListeners();
  }
  void selectedSubCraft(String value) {
    selectSubCraft = value;
    notifyListeners();
  }

   void selectedSeniorLevel(String value) {
    selectExperienceLevel = value;
    notifyListeners();
  }

}
