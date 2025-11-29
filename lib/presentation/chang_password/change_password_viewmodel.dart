import 'package:flutter/cupertino.dart';

class ChangePasswordViewmodel extends ChangeNotifier{

  // State
  TextEditingController _currentPassword=TextEditingController();
  TextEditingController _newPassword=TextEditingController();
  TextEditingController _reTypePassword=TextEditingController();

  // Getters
  TextEditingController get currentPassword=>_currentPassword;
  TextEditingController get newPassword=>_newPassword;
  TextEditingController get reTypePassword=>_reTypePassword;

}