import 'package:flutter/cupertino.dart';

class EditScenicOrderEntryViewmodel extends ChangeNotifier{

  // State
  TextEditingController _sceneNumController=TextEditingController();
  TextEditingController _subSceneNumController=TextEditingController();
  TextEditingController _descriptionController=TextEditingController();
  TextEditingController _locationController=TextEditingController();
  TextEditingController _actorsController=TextEditingController();

  // Getters
  TextEditingController get sceneNemController=>_sceneNumController;
  TextEditingController get subSceneNemController=>_subSceneNumController;
  TextEditingController get descriptionController=>_descriptionController;
  TextEditingController get locationController=>_locationController;
  TextEditingController get actorsController=>_actorsController;


}