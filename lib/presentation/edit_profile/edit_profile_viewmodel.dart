import 'package:flutter/cupertino.dart';

class EditProfileViewmodel extends ChangeNotifier{

  // State
  TextEditingController _nameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _mobileNumController=TextEditingController();
  TextEditingController _portfolioLinkController=TextEditingController();
  TextEditingController _locationController=TextEditingController();
  TextEditingController _bioController=TextEditingController();
  String? _selectedCraft;
  String? _selectedSubCraft;
  String? _selectedExperience;

  // Getters
  TextEditingController get nameController=>_nameController;
  TextEditingController get emailController=>_emailController;
  TextEditingController get mobileNumController=>_mobileNumController;
  TextEditingController get portfolioLinkController=>_portfolioLinkController;
  TextEditingController get locationController=>_locationController;
  TextEditingController get bioController=>_bioController;
  String? get selectedCraft=>_selectedCraft;
  String? get selectedSubCraft=>_selectedSubCraft;
  String? get selectedExperience=>_selectedExperience;

  // Setters
  set setSelectedCraft(String newSelectedCraft){
    _selectedCraft=newSelectedCraft;
    notifyListeners();
  }
  set setSelectedSubCraft(String newSelectedCraft){
    _selectedSubCraft=newSelectedCraft;
    notifyListeners();
  }
  set setSelectedExperience(String newSelectedCraft){
    _selectedExperience=newSelectedCraft;
    notifyListeners();
  }

  // Behaviour
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.clear();
    _emailController.clear();
    _mobileNumController.clear();
    _locationController.clear();
    _portfolioLinkController.clear();
    _bioController.clear();

  }

}