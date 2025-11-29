import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditMemberViewmodel extends ChangeNotifier {
  final BuildContext context;
EditMemberViewmodel({
  required this.context
});
final TextEditingController nameController = TextEditingController();
final TextEditingController roleController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phoneController = TextEditingController();

} 